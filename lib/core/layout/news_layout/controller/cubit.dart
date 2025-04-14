import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/layout/news_layout/controller/state.dart';
import 'package:swd4_s4/core/shared/network/remote/news_helper.dart';
import 'package:swd4_s4/features/news/business/presentation/screens/business_screen.dart';
import 'package:swd4_s4/features/news/science/presentation/screens/science_screen.dart';
import 'package:swd4_s4/features/news/sports/presentation/screens/sports_screen.dart';


class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitialNewsState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business_sharp),
      label: 'Business',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.sports_baseball), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  List<String> titles = ['Business', 'Sports', 'Science'];
  List<Widget> screens = [BusinessScreen(), SportsScreen(), ScienceScreen()];
  int currentIndex = 0;
  var searchController = TextEditingController();

  void changeBottomNav(index) {
    currentIndex = index;
    emit(NewsChangeBottomNavState());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    NewsHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'apiKey': 'c799708afa624ae3b9742682fb271251',
        'category': 'business',
      },
    ).then((value) {
      business = value.data['articles'];
      debugPrint('The business is: ${value.data['articles']}');
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      emit(NewsGetBusinessErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }

  void getSports() {
    emit(NewsGetSportsLoadingState());

    NewsHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'apiKey': 'c799708afa624ae3b9742682fb271251',
        'category': 'sports',
      },
    ).then((value) {
      sports = value.data['articles'];
      debugPrint('The sports is: ${value.data['articles']}');
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      emit(NewsGetSportsErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }

  void getScience() {
    emit(NewsGetScienceLoadingState());

    NewsHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'apiKey': 'c799708afa624ae3b9742682fb271251',
        'category': 'science',
      },
    ).then((value) {
      science = value.data['articles'];
      debugPrint('The science is: ${value.data['articles']}');
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      emit(NewsGetScienceErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }

  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());
    NewsHelper.getData(
        url: 'v2/everything',
        query:
        {
          'apiKey': 'c799708afa624ae3b9742682fb271251',
          'q' : value,
        },
    ).then((value){
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      emit(NewsGetSearchErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }
}
