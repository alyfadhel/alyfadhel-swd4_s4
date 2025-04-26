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
import 'package:swd4_s4/features/shop/users/login/presntation/screens/shop_login_screen.dart';
import 'package:swd4_s4/features/shop/users/register/presntation/controller/cubit.dart';
import 'package:swd4_s4/features/shop/users/register/presntation/controller/state.dart';

class ShopRegisterScreen extends StatelessWidget {
  const ShopRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (context, state) {
          if (state is ShopRegisterGetUserSuccessState) {
            if (state.shopRegisterModel!.status) {
              showToast(
                msg: state.shopRegisterModel!.message,
                state: ToastState.success,
              );
              CacheHelper.setData(key: 'token', value: state.shopRegisterModel!.data!.token).then((value){
                if(context.mounted) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ShopLoginScreen(),));
                }
              });
              token = state.shopRegisterModel!.data!.token;
            }else{
              showToast(
                msg: state.shopRegisterModel!.message,
                state: ToastState.error,
              );
            }
          }
        },
        builder: (context, state) {
          var cubit = ShopRegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(automaticallyImplyLeading: false),
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
                          'Register',
                          style: Theme.of(
                            context,
                          ).textTheme.headlineLarge!.copyWith(fontSize: 40.0),
                        ),
                        Text(
                          'Register to browse hot offers',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge!.copyWith(color: Colors.grey),
                        ),
                        SizedBox(height: 40.0),
                        MyFormField(
                          controller: cubit.nameController,
                          type: TextInputType.text,
                          prefix: Icons.person,
                          text: 'name',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Name must be not empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0),
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
                          controller: cubit.phoneController,
                          type: TextInputType.phone,
                          prefix: Icons.phone_android,
                          text: 'phone',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Phone must be not empty';
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
                          condition: state is! ShopRegisterGetUserLoadingState,
                          builder:
                              (context) => MyButton(
                                onPressed: () {
                                  if (cubit.formKey.currentState!.validate()) {
                                    cubit.registerUser(
                                      name: cubit.nameController.text,
                                      email: cubit.emailController.text,
                                      phone: cubit.phoneController.text,
                                      password: cubit.phoneController.text,
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
                              'Already have an account',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            SizedBox(width: 10.0),
                            MyTxtButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ShopLoginScreen(),
                                  ),
                                );
                              },
                              text: 'Login',
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
