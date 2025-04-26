import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/layout/shop/controller/state.dart';
import 'package:swd4_s4/core/shared/const/constanse.dart';
import 'package:swd4_s4/core/shared/network/remote/shop_helper.dart';
import 'package:swd4_s4/features/shop/categories/presentation/screens/categories_screen.dart';
import 'package:swd4_s4/features/shop/favorites/data/model/favorites_model.dart';
import 'package:swd4_s4/features/shop/favorites/presentation/screens/favorites_screen.dart';
import 'package:swd4_s4/features/shop/home/data/model/categories_home_model.dart';
import 'package:swd4_s4/features/shop/home/data/model/change_favorites_model.dart';
import 'package:swd4_s4/features/shop/home/data/model/shop_home_model.dart';
import 'package:swd4_s4/features/shop/home/presentation/screens/shop_home_screen.dart';
import 'package:swd4_s4/features/shop/product_details/data/model/product_details_model.dart';
import 'package:swd4_s4/features/shop/settings/data/model/profile_model.dart';
import 'package:swd4_s4/features/shop/settings/data/model/update_profile_model.dart';
import 'package:swd4_s4/features/shop/settings/presentation/screens/settings_screen.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(InitialShoState());

  static ShopCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];
  List<String> titles = ['Home', 'Categories', 'Favorites', 'Settings'];
  List<Widget> screens = [
    ShopHomeScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];
  int currentIndex = 0;
  int current = 0;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  void changeSmoothIndicator(index)
  {
    current = index;
    emit(ShopChangeSmoothIndicatorState());
  }

  void changeLanguage()
  {
    if(language == 'ar'){
      language = 'en';
    }else{
      language = 'ar';
    }
    emit(ShopChangeLanguageState());
  }

  void changeBottomNav(index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  ShopHomeModel? shopHomeModel;
  Map<int, bool> favorites = {};

  void getHome() {
    emit(ShopGetHomeLoadingState());

    ShopHelper.getData(
        url: homeEndPoint,
      token: token,
      lang: language,
    )
        .then((value) {
          shopHomeModel = ShopHomeModel.fromJson(value.data);
          debugPrint('The Home is: ${value.data}');
          shopHomeModel!.data!.products.forEach((element) {
            favorites.addAll({element.id: element.inFavorites});
          });
          debugPrint('The Favorites Home is: $favorites');
          emit(ShopGetHomeSuccessState());
        })
        .catchError((error) {
          emit(ShopGetHomeErrorState(error.toString()));
          debugPrint(error.toString());
        });
  }

  ChangeFavoritesModel? changeFavoritesModel;

  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(ShopChangeFavoritesLoadingState());
    ShopHelper.postData(
          url: changeFavoritesEndPoint,
          data: {'product_id': productId},
          token: token,
          lang: language,
        )
        .then((value) {
          changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
          if (!changeFavoritesModel!.status) {
            favorites[productId] = !favorites[productId]!;
          } else {
            getFavorites();
          }
          emit(ShopChangeFavoritesSuccessState(changeFavoritesModel!));
        })
        .catchError((error) {
          emit(ShopChangeFavoritesErrorState(error.toString()));
          debugPrint(error.toString());
        });
  }

  FavoritesModel? favoritesModel;

  void getFavorites() {
    emit(ShopGetFavoritesLoadingState());
    ShopHelper.getData(
        url: favoritesEndPoint,
        token: token,
        lang: language,
    )
        .then((value) {
          favoritesModel = FavoritesModel.fromJson(value.data);
          debugPrint('The Favorites is: ${value.data}');
          emit(ShopGetFavoritesSuccessState());
        })
        .catchError((error) {
          emit(ShopGetFavoritesErrorState(error.toString()));
          debugPrint(error.toString());
        });
  }

  CategoriesHomeModel? categoriesHomeModel;

  void getCategoriesHome() {
    emit(ShopGetCategoriesHomeLoadingState());

    ShopHelper.getData(
        url: categoriesEndPoint,
        lang: language,
    )
        .then((value) {
          categoriesHomeModel = CategoriesHomeModel.fromJson(value.data);
          debugPrint('The Categories Home is: ${value.data}');
          emit(ShopGetCategoriesHomeSuccessState());
        })
        .catchError((error) {
          emit(ShopGetCategoriesHomeErrorState(error.toString()));
          debugPrint(error.toString());
        });
  }

  ProfileModel? profileModel;

  void getProfile() {
    emit(ShopGetProfileLoadingState());

    ShopHelper.getData(
      url: profileEndPoint,
      token: token,
      lang: language,
    ).then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      debugPrint('The profile is: ${value.data}');
      emit(ShopGetProfileSuccessState());
    }).catchError((error) {
      emit(ShopGetProfileErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }

  UpdateProfileModel? updateProfileModel;

  void updateProfile({
    required String name,
    required String email,
    required String phone,
})
  {
    emit(ShopGetUpdateProfileLoadingState());
    
    ShopHelper.putData(
        url: updateProfileEndPoint,
        data: {
          'name' : name,
          'email' : email,
          'phone' : phone,
        },
      token: token,
      lang: language,
    ).then((value){
      updateProfileModel = UpdateProfileModel.fromJson(value.data);
      getProfile();
      emit(ShopGetUpdateProfileSuccessState(updateProfileModel!));
    }).catchError((error){
      emit(ShopGetUpdateProfileErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }

  ProductDetailsModel? productDetailsModel;

  void productDetails(int id)
  {
    emit(ShopGetProductDetailsLoadingState());

    ShopHelper.getData(
      url: productDetailsEndPoint(id),
      token: token,
      lang: language,
    ).then((value){
      productDetailsModel = ProductDetailsModel.fromJsom(value.data);
      debugPrint('The Product Details is: ${value.data}');
      emit(ShopGetProductDetailsSuccessState());
    }).catchError((error){
      emit(ShopGetProductDetailsErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }
}
