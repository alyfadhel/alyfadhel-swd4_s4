import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/layout/shop/controller/cubit.dart';
import 'package:swd4_s4/core/layout/shop/controller/state.dart';
import 'package:swd4_s4/core/shared/widgets/my_form_field.dart';
import 'package:swd4_s4/core/shared/widgets/toast_state.dart';
import 'package:swd4_s4/features/shop/settings/presentation/widgets/build_settings_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()..getProfile(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {
          if (state is ShopGetUpdateProfileSuccessState) {
            if (state.updateProfileModel!.status) {
              showToast(
                msg: state.updateProfileModel!.message,
                state: ToastState.success,
              );
            }else{
              showToast(
                msg: state.updateProfileModel!.message,
                state: ToastState.error,
              );
            }
          }
        },
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return ConditionalBuilder(
            condition: cubit.profileModel != null,
            builder:
                (context) =>
                    BuildSettingsScreen(model: cubit.profileModel!.data!),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
