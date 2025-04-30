import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/layout/shop/controller/cubit.dart';
import 'package:swd4_s4/core/layout/shop/controller/state.dart';
import 'package:swd4_s4/core/shared/const/constanse.dart';
import 'package:swd4_s4/core/shared/network/local/cache_helper.dart';
import 'package:swd4_s4/core/shared/themes/controller/cubit.dart';
import 'package:swd4_s4/features/news/search/presentation/screens/search_screen.dart';
import 'package:swd4_s4/features/shop/search/presentation/screen/shop_search_screen.dart';
import 'package:swd4_s4/main.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [
              IconButton(
                onPressed: ()
                {
                  cubit.changeLanguage();
                  CacheHelper.setData(key: 'language', value: language).then((value){
                    if(context.mounted)
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp(
                        isDark: ThemeModeCubit.get(context).isDark,
                        startWidget: ShopLayout()),));
                    }
                  });
                }, icon: CircleAvatar(
                radius: 16.0,
                backgroundColor: Colors.grey,
                child: CircleAvatar(
                  radius: 15.0,
                  backgroundColor: Colors.white,
                  child: Text(
                    language.toUpperCase(),
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),),
              IconButton(
                onPressed: () {
                  ThemeModeCubit.get(context).changeThemeMode();
                },
                icon: Icon(Icons.brightness_4_outlined),
              ),
              IconButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ShopSearchScreen(),));
              },
                  icon: Icon(Icons.search)),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.items,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
