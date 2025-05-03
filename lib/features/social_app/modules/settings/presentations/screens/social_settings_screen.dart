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
      listener: (context, state) {

      },
      builder: (context, state) {
        var userModel = SocialCubit.get(context).socialUserModel!;
        return Padding(
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
                              'https://img.freepik.com/free-photo/silhouette-woman-praying-with-god_1150-5392.jpg?t=st=1746290702~exp=1746294302~hmac=5bb017f66c93044c69738957dbf1e2421583563baef8665a54f3db9ebdf09cbe&w=740',
                            ),
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 65.0,
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 60.0,
                        backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-photo/full-shot-man-doing-yoga_23-2151084042.jpg?t=st=1746292893~exp=1746296493~hmac=ace6b7479f034d2c5c88a63590667d362620a000e34c210437e4a868fd21bc08&w=740',
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
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
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
        );
      },
    );
  }
}
