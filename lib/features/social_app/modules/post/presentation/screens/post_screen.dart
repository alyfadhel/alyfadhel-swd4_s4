import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/layout/social_layout/controller/cubit.dart';
import 'package:swd4_s4/core/layout/social_layout/controller/state.dart';
import 'package:swd4_s4/core/shared/themes/controller/cubit.dart';
import 'package:swd4_s4/core/shared/themes/styles/icon_broken.dart';
import 'package:swd4_s4/core/shared/widgets/my_txt_button.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        var userModel = SocialCubit.get(context).socialUserModel!;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Iconly_Broken.Arrow___Left_2),
            ),
            title: Padding(
              padding: const EdgeInsetsDirectional.only(end: 70.0),
              child: Text('Create Post'),
            ),
            actions: [
              MyTxtButton(
                onPressed: () {
                  if (cubit.postImage == null) {
                    cubit.createPost(
                      dateTime: DateTime.now().toString(),
                      text: cubit.textController.text,
                    );
                  } else {
                    cubit.uploadPostImage(
                      dateTime: DateTime.now().toString(),
                      text: cubit.textController.text,
                    );
                  }
                },
                text: 'post',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color:
                      ThemeModeCubit.get(context).isDark
                          ? Colors.blue
                          : Colors.deepOrange,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if (state is SocialUserUpdateLoadingState)
                  LinearProgressIndicator(),
                if (state is SocialUserUpdateLoadingState)
                  SizedBox(height: 30.0),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 35.0,
                      backgroundImage: NetworkImage(userModel.image),
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      userModel.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(
                      color:
                          ThemeModeCubit.get(context).isDark
                              ? Colors.black
                              : Colors.white,
                    ),
                    controller: cubit.textController,
                    decoration: InputDecoration(
                      hintText: 'What is on your mind...',
                      hintStyle: TextStyle(
                        color:
                            ThemeModeCubit.get(context).isDark
                                ? Colors.black
                                : Colors.white,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if (cubit.postImage != null)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        width: double.infinity,
                        height: 200.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(cubit.postImage!),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                          vertical: 10.0,
                        ),
                        child: CircleAvatar(
                          radius: 16.0,
                          backgroundColor:
                              ThemeModeCubit.get(context).isDark
                                  ? Colors.blue
                                  : Colors.deepOrange,
                          child: IconButton(
                            onPressed: () {
                              cubit.removePost();
                            },
                            icon: Icon(
                              Icons.close,
                              size: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          cubit.getPostImage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Iconly_Broken.Image,
                              size: 30.0,
                              color:
                                  ThemeModeCubit.get(context).isDark
                                      ? Colors.blue
                                      : Colors.deepOrange,
                            ),
                            SizedBox(width: 8.0),
                            Text(
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
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          '# tags',
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
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
