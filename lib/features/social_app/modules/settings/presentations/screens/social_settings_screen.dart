import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/layout/social_layout/controller/cubit.dart';
import 'package:swd4_s4/core/layout/social_layout/controller/state.dart';
import 'package:swd4_s4/core/shared/themes/controller/cubit.dart';
import 'package:swd4_s4/core/shared/themes/styles/icon_broken.dart';
import 'package:swd4_s4/core/shared/widgets/my_button.dart';
import 'package:swd4_s4/features/social_app/modules/settings/presentations/screens/edit_profile_screen.dart';

class SocialSettingsScreen extends StatelessWidget {
  const SocialSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SocialCubit.get(context).socialUserModel;
        return ConditionalBuilder(
          condition: userModel != null,
          builder:
              (context) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 270.0,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
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
                                  image: NetworkImage(
                                    userModel!.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 65.0,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: CircleAvatar(
                              radius: 60.0,
                              backgroundImage: NetworkImage(
                                userModel.image,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      userModel.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      userModel.bio,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(height: 40.0),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(),
                              side: BorderSide(
                                color:
                                    ThemeModeCubit.get(context).isDark
                                        ? Colors.blue
                                        : Colors.deepOrange,
                              ),
                            ),
                            child: Text(
                              'Add Photo',
                              style: Theme.of(
                                context,
                              ).textTheme.titleMedium!.copyWith(
                                color:
                                    ThemeModeCubit.get(context).isDark
                                        ? Colors.blue
                                        : Colors.deepOrange,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15.0),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfileScreen(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            side: BorderSide(
                              color:
                                  ThemeModeCubit.get(context).isDark
                                      ? Colors.blue
                                      : Colors.deepOrange,
                            ),
                          ),
                          child: Icon(
                            Iconly_Broken.Edit,
                            color:
                                ThemeModeCubit.get(context).isDark
                                    ? Colors.blue
                                    : Colors.deepOrange,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.0),
                    MyButton(
                      onPressed: () {},
                      text: 'logout',
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(color: Colors.white),
                      background:
                          ThemeModeCubit.get(context).isDark
                              ? Colors.blue
                              : Colors.deepOrange,
                    ),
                  ],
                ),
              ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
