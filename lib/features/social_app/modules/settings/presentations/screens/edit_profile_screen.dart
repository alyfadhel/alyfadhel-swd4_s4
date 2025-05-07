import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/layout/social_layout/controller/cubit.dart';
import 'package:swd4_s4/core/layout/social_layout/controller/state.dart';
import 'package:swd4_s4/core/shared/themes/controller/cubit.dart';
import 'package:swd4_s4/core/shared/themes/styles/icon_broken.dart';
import 'package:swd4_s4/core/shared/widgets/my_button.dart';
import 'package:swd4_s4/core/shared/widgets/my_form_field.dart';
import 'package:swd4_s4/core/shared/widgets/my_txt_button.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        var userModel = SocialCubit.get(context).socialUserModel!;
        var profileImage = SocialCubit.get(context).profileImage;
        var coverImage = SocialCubit.get(context).coverImage;
        cubit.nameController.text = userModel.name;
        cubit.phoneController.text = userModel.phone;
        cubit.bioController.text = userModel.bio;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Iconly_Broken.Arrow___Left_2),
            ),
            title: Text(
              'Edit Profile',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [
              MyTxtButton(
                onPressed: () {
                  cubit.updateUser(
                    name: cubit.nameController.text,
                    phone: cubit.phoneController.text,
                    bio: cubit.bioController.text,
                  );
                },
                text: 'update',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color:
                      ThemeModeCubit.get(context).isDark
                          ? Colors.blue
                          : Colors.deepOrange,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  if (state is SocialUserUpdateLoadingState)
                    LinearProgressIndicator(),
                  if (state is SocialUserUpdateLoadingState)
                    SizedBox(height: 30.0),
                  SizedBox(
                    height: 270.0,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Align(
                              alignment: AlignmentDirectional.topCenter,
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                width: double.infinity,
                                height: 200.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        coverImage == null
                                            ? NetworkImage(userModel.cover)
                                            : FileImage(coverImage),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                top: 10.0,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  cubit.getCoverImage();
                                },
                                icon: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: 14.0,
                                  child: Icon(
                                    Iconly_Broken.Camera,
                                    size: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 65.0,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundImage:
                                    profileImage == null
                                        ? NetworkImage(userModel.image)
                                        : FileImage(profileImage),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                cubit.getProfileImage();
                              },
                              icon: CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 14.0,
                                child: Icon(
                                  Iconly_Broken.Camera,
                                  size: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0),
                  if(SocialCubit.get(context).coverImage != null || SocialCubit.get(context).profileImage != null)
                  Column(
                    children: [
                      Row(
                        children: [
                          if(SocialCubit.get(context).coverImage != null)
                            Expanded(
                            child: MyButton(
                              onPressed: () {
                                cubit.uploadCoverImage(
                                  name: cubit.nameController.text,
                                  phone: cubit.phoneController.text,
                                  bio: cubit.bioController.text,
                                );
                              },
                              background: ThemeModeCubit.get(context).isDark ? Colors.blue : Colors.deepOrange,
                              text: 'update cover',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          if(SocialCubit.get(context).profileImage != null)
                            Expanded(
                            child: MyButton(
                              onPressed: () {
                                cubit.uploadProfileImage(
                                  name: cubit.nameController.text,
                                  phone: cubit.phoneController.text,
                                  bio: cubit.bioController.text,
                                );
                              },
                              background: ThemeModeCubit.get(context).isDark ? Colors.blue : Colors.deepOrange,
                              text: 'update profile',
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MyFormField(
                    controller: cubit.nameController,
                    type: TextInputType.name,
                    prefix: Iconly_Broken.User,
                    text: 'name',
                  ),
                  SizedBox(height: 20.0),
                  MyFormField(
                    controller: cubit.phoneController,
                    type: TextInputType.phone,
                    prefix: Iconly_Broken.Call,
                    text: 'phone',
                  ),
                  SizedBox(height: 20.0),
                  MyFormField(
                    controller: cubit.bioController,
                    type: TextInputType.text,
                    prefix: Iconly_Broken.Info_Circle,
                    text: 'bio',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
