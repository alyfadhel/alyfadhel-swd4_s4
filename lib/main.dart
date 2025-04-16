import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/layout/news_layout/controller/cubit.dart';
import 'package:swd4_s4/core/layout/news_layout/news_layout.dart';
import 'package:swd4_s4/core/layout/shop/controller/cubit.dart';
import 'package:swd4_s4/core/layout/shop/shop_layout.dart';
import 'package:swd4_s4/core/observer/bloc_observer.dart';
import 'package:swd4_s4/core/shared/const/constanse.dart';
import 'package:swd4_s4/core/shared/network/local/cache_helper.dart';
import 'package:swd4_s4/core/shared/network/remote/news_helper.dart';
import 'package:swd4_s4/core/shared/network/remote/shop_helper.dart';
import 'package:swd4_s4/core/shared/themes/controller/cubit.dart';
import 'package:swd4_s4/core/shared/themes/controller/state.dart';
import 'package:swd4_s4/core/shared/themes/theme_mode.dart';
import 'package:swd4_s4/features/shop/on_boarding/presentatio/screens/on_boarding_screen.dart';
import 'package:swd4_s4/features/shop/users/login/presntation/screens/shop_login_screen.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  ShopHelper.init();
  NewsHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  bool?onBoarding = CacheHelper.getData(key: 'onBoarding');
  debugPrint(onBoarding.toString());
  token = CacheHelper.getData(key: 'token');
  debugPrint(token.toString());
  Widget widget;
  if(onBoarding != null){
    if(token != null){
      widget = ShopLayout();
    }else {
      widget = ShopLoginScreen();
    }
  }else{
    widget = OnBoardingScreen();
  }
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(
        isDark: isDark,
        startWidget: widget,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget startWidget;
  const MyApp({super.key, required this.isDark, required this.startWidget});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context) => ThemeModeCubit()..changeThemeMode(
          fromShared: isDark,
        ),),
        BlocProvider(create: (context) => NewsCubit()..getBusiness()..getSports()..getScience(),),
        BlocProvider(create: (context) => ShopCubit()..getHome()..getCategoriesHome(),),
      ],
      child: BlocConsumer<ThemeModeCubit,ThemeModeStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: getLightMode(),
            darkTheme: getDarkMode(),
            themeMode: ThemeModeCubit.get(context).isDark ?  ThemeMode.light : ThemeMode.dark,
            home: startWidget,
          );
        },
      ),
    );
  }
}

// POST
// DELETE
// UPDATE
// GET
// PUT

//https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=c799708afa624ae3b9742682fb271251

// base url: https://newsapi.org/
// path(url): v2/top-headlines?
// Query: country=us&apiKey=c799708afa624ae3b9742682fb271251

//przI6d66qfF5zoed82dYLqJwW0OjTxgjmQzLIW1tMudTIG2aoB1tGHVOMqaUkfJKaukAf8
//YLKpqe8U8ZM3Oxw5TTI3eSgTeARY3aLPO4QQHVM8pEWJueAGFZ6p4FJrvL2iyicFYy7nqm