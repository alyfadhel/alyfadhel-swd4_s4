import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/layout/shop/controller/cubit.dart';
import 'package:swd4_s4/core/layout/shop/controller/state.dart';
import 'package:swd4_s4/core/shared/themes/controller/cubit.dart';
import 'package:swd4_s4/features/shop/categories/presentation/widgets/build_categories_screen.dart';
import 'package:swd4_s4/features/shop/home/data/model/categories_home_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder:
              (context, index) => BuildCategoriesScreen(
                model: cubit.categoriesHomeModel!.data.data[index],
              ),
          itemCount: cubit.categoriesHomeModel!.data.data.length,
        );
      },
    );
  }
}
