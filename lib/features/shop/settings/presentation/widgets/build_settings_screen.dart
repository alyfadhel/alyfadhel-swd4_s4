import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/layout/shop/controller/cubit.dart';
import 'package:swd4_s4/core/layout/shop/controller/state.dart';
import 'package:swd4_s4/core/shared/network/local/cache_helper.dart';
import 'package:swd4_s4/core/shared/themes/controller/cubit.dart';
import 'package:swd4_s4/core/shared/widgets/my_button.dart';
import 'package:swd4_s4/core/shared/widgets/my_form_field.dart';
import 'package:swd4_s4/features/login/login_screen.dart';
import 'package:swd4_s4/features/shop/settings/data/model/profile_model.dart';
import 'package:swd4_s4/features/shop/users/login/presntation/screens/shop_login_screen.dart';

class BuildSettingsScreen extends StatelessWidget {
  final ProfileDataModel model;

  const BuildSettingsScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        cubit.nameController.text = model.name;
        cubit.emailController.text = model.email;
        cubit.phoneController.text = model.phone;
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                if(state is ShopGetUpdateProfileLoadingState)
                  LinearProgressIndicator(),
                if(state is ShopGetUpdateProfileLoadingState)
                  SizedBox(
                    height: 30.0,
                  ),
                SizedBox(
                  height: 250.0,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Container(
                          width: double.infinity,
                          height: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.red,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(model.image),
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 60.0,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(model.image),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.0),
                MyFormField(
                  controller: cubit.nameController,
                  type: TextInputType.text,
                  prefix: Icons.person,
                  text: 'name',
                ),
                SizedBox(height: 20.0),
                MyFormField(
                  controller: cubit.emailController,
                  type: TextInputType.emailAddress,
                  prefix: Icons.email_outlined,
                  text: 'email address',
                ),
                SizedBox(height: 20.0),
                MyFormField(
                  controller: cubit.phoneController,
                  type: TextInputType.phone,
                  prefix: Icons.phone_android,
                  text: 'phone',
                ),
                SizedBox(height: 40.0),
                MyButton(
                  onPressed: () {
                    cubit.updateProfile(
                      name: cubit.nameController.text,
                      email: cubit.emailController.text,
                      phone: cubit.phoneController.text,
                    );
                  },
                  text: 'update',
                  background:
                      ThemeModeCubit.get(context).isDark
                          ? Colors.blue
                          : Colors.deepOrange,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(color: Colors.white),
                ),
                SizedBox(height: 40.0),
                MyButton(
                  onPressed: ()
                  {
                    CacheHelper.removeData(key: 'token').then((value){
                      if(context.mounted) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ShopLoginScreen(),));
                      }
                    });
                  },
                  text: 'LogOut',
                  isUpperCase: false,
                  background:
                  ThemeModeCubit.get(context).isDark
                      ? Colors.blue
                      : Colors.deepOrange,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
