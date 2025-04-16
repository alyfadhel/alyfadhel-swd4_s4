import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/layout/shop/controller/cubit.dart';
import 'package:swd4_s4/core/layout/shop/controller/state.dart';
import 'package:swd4_s4/core/shared/themes/controller/cubit.dart';

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
                onPressed: () {
                  ThemeModeCubit.get(context).changeThemeMode();
                },
                icon: Icon(Icons.brightness_4_outlined),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
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
