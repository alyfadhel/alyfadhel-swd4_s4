import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/layout/shop/controller/state.dart';
import 'package:swd4_s4/core/shared/const/constanse.dart';
import 'package:swd4_s4/core/shared/network/remote/shop_helper.dart';
import 'package:swd4_s4/features/shop/categories/presentation/screens/categories_screen.dart';
import 'package:swd4_s4/features/shop/favorites/presentation/screens/favorites_screen.dart';
import 'package:swd4_s4/features/shop/home/data/model/categories_home_model.dart';
import 'package:swd4_s4/features/shop/home/data/model/shop_home_model.dart';
import 'package:swd4_s4/features/shop/home/presentation/screens/shop_home_screen.dart';
import 'package:swd4_s4/features/shop/settings/presentation/screens/settings_screen.dart';

class ShopCubit extends Cubit<ShopStates>{

  ShopCubit():super(InitialShoState());

  static ShopCubit get(context)=>BlocProvider.of(context);

  List<BottomNavigationBarItem>items = [
    BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'Home',),
    BottomNavigationBarItem(icon: Icon(Icons.category,),label: 'Categories',),
    BottomNavigationBarItem(icon: Icon(Icons.favorite,),label: 'Favorites',),
    BottomNavigationBarItem(icon: Icon(Icons.settings,),label: 'Settings',),
  ];
  List<String>titles = [
    'Home',
    'Categories',
    'Favorites',
    'Settings',
  ];
  List<Widget>screens = [
    ShopHomeScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];
  int currentIndex = 0;

  void changeBottomNav(index)
  {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  ShopHomeModel? shopHomeModel;

  void getHome()
  {
    emit(ShopGetHomeLoadingState());
    
    ShopHelper.getData(
      url: homeEndPoint,
      token: token,
    ).then((value){
      shopHomeModel = ShopHomeModel.fromJson(value.data);
      debugPrint('The Home is: ${value.data}');
      emit(ShopGetHomeSuccessState());
    }).catchError((error){
      emit(ShopGetHomeErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }

  CategoriesHomeModel? categoriesHomeModel;

  void getCategoriesHome()
  {
    emit(ShopGetCategoriesHomeLoadingState());

    ShopHelper.getData(
      url: categoriesEndPoint,
    ).then((value){
      categoriesHomeModel = CategoriesHomeModel.fromJson(value.data);
      debugPrint('The Categories Home is: ${value.data}');
      emit(ShopGetCategoriesHomeSuccessState());
    }).catchError((error){
      emit(ShopGetCategoriesHomeErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }
}