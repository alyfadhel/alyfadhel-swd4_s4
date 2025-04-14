import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/layout/news_layout/controller/cubit.dart';
import 'package:swd4_s4/core/layout/news_layout/controller/state.dart';
import 'package:swd4_s4/core/shared/themes/controller/cubit.dart';
import 'package:swd4_s4/features/news/search/presentation/screens/search_screen.dart';


class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
            actions:
            [
              IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),),);
                },
                icon: Icon(Icons.search,
                ),
              ),
              IconButton(onPressed: (){
                ThemeModeCubit.get(context).changeThemeMode();
              }, icon: Icon(Icons.brightness_4_outlined,),),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.items,
            onTap: (index)
            {
              cubit.changeBottomNav(index);
            },
            currentIndex: cubit.currentIndex,
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
