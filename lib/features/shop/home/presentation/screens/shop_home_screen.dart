import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swd4_s4/core/layout/shop/controller/cubit.dart';
import 'package:swd4_s4/core/layout/shop/controller/state.dart';
import 'package:swd4_s4/core/shared/widgets/toast_state.dart';
import 'package:swd4_s4/features/shop/home/data/model/shop_home_model.dart';
import 'package:swd4_s4/features/shop/home/presentation/widgets/build_item.dart';

class ShopHomeScreen extends StatelessWidget {
  const ShopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopChangeFavoritesSuccessState) {
          if (state.changeFavoritesModel.status) {
            showToast(
              msg: state.changeFavoritesModel.message,
              state: ToastState.success,
            );
          } else {
            showToast(
              msg: state.changeFavoritesModel.message,
              state: ToastState.error,
            );
          }
        }
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return ConditionalBuilder(
          condition:
              cubit.shopHomeModel != null && cubit.categoriesHomeModel != null,
          builder: (context) => BuildItem(model: cubit.shopHomeModel!),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
