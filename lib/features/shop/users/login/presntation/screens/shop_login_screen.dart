import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/layout/shop/shop_layout.dart';
import 'package:swd4_s4/core/shared/const/constanse.dart';
import 'package:swd4_s4/core/shared/network/local/cache_helper.dart';
import 'package:swd4_s4/core/shared/widgets/my_button.dart';
import 'package:swd4_s4/core/shared/widgets/my_form_field.dart';
import 'package:swd4_s4/core/shared/widgets/my_txt_button.dart';
import 'package:swd4_s4/core/shared/widgets/toast_state.dart';
import 'package:swd4_s4/features/shop/users/login/presntation/controller/cubit.dart';
import 'package:swd4_s4/features/shop/users/login/presntation/controller/state.dart';

class ShopLoginScreen extends StatelessWidget {
  const ShopLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is ShopLoginGetUserSuccessState) {
            if (state.shopLoginModel.status) {
              showToast(
                msg: state.shopLoginModel.message,
                state: ToastState.success,
              );
              CacheHelper.setData(
                key: 'token',
                value: state.shopLoginModel.data!.token,
              ).then((value) {
                if (context.mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ShopLayout()),
                  );
                }
                token = state.shopLoginModel.data!.token;
              });
            } else {
              showToast(
                msg: state.shopLoginModel.message,
                state: ToastState.error,
              );
            }
          }
        },
        builder: (context, state) {
          var cubit = ShopLoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: Theme.of(
                            context,
                          ).textTheme.headlineLarge!.copyWith(fontSize: 40.0),
                        ),
                        Text(
                          'Login to browse hot offers',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge!.copyWith(color: Colors.grey),
                        ),
                        SizedBox(height: 40.0),
                        MyFormField(
                          controller: cubit.emailController,
                          type: TextInputType.emailAddress,
                          prefix: Icons.email_outlined,
                          text: 'email address',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email must be not empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0),
                        MyFormField(
                          controller: cubit.passwordController,
                          type: TextInputType.visiblePassword,
                          prefix: Icons.lock_outline,
                          text: 'password',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password must be not empty';
                            }
                            return null;
                          },
                          isPassword: cubit.isPassword,
                          suffix: cubit.suffix,
                          onSuffixPressed: () {
                            cubit.changePasswordVisibility();
                          },
                        ),
                        SizedBox(height: 30.0),
                        ConditionalBuilder(
                          condition: state is! ShopLoginGetUserLoadingState,
                          builder:
                              (context) => MyButton(
                                onPressed: () {
                                  if (cubit.formKey.currentState!.validate()) {
                                    cubit.getUser(
                                      email: cubit.emailController.text,
                                      password: cubit.passwordController.text,
                                    );
                                  }
                                },
                                text: 'login',
                                style: Theme.of(context).textTheme.titleLarge!
                                    .copyWith(color: Colors.white),
                              ),
                          fallback:
                              (context) =>
                                  Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account ?!',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            SizedBox(width: 10.0),
                            MyTxtButton(
                              onPressed: () {},
                              text: 'Register',
                              isUpperCase: false,
                              style: Theme.of(context).textTheme.titleLarge!
                                  .copyWith(color: Colors.blue, fontSize: 30.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
