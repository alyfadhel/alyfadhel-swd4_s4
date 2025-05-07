import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/layout/social_layout/controller/cubit.dart';
import 'package:swd4_s4/core/layout/social_layout/controller/state.dart';
import 'package:swd4_s4/core/shared/themes/styles/icon_broken.dart';
import 'package:swd4_s4/features/social_app/modules/home/presentations/widgets/build_social_home_item.dart';

class SocialHomeScreen extends StatelessWidget {
  const SocialHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.posts.isNotEmpty,
          builder: (context) =>
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Card(
                          margin: EdgeInsets.symmetric(horizontal: 8.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 5,
                          child: Container(
                            width: double.infinity,
                            height: 250.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'https://img.freepik.com/free-photo/faith-christian-concept-spiritual-prayer-hands-sun-shine_1150-9112.jpg?t=st=1746289937~exp=1746293537~hmac=0311fa51088531053ccbe82f060a24ad42177eedbb677b993160e69d18584c59&w=740',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 15.0,
                          ),
                          child: Text(
                            'Communicate with friends...',
                            style: Theme
                                .of(
                              context,
                            )
                                .textTheme
                                .titleLarge!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          BuildSocialHomeItem(
                            model: cubit.posts[index],
                          ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10.0),
                      itemCount: cubit.posts.length,
                    ),
                  ],
                ),
              ),
          fallback: (context) => Center(child: CircularProgressIndicator(),),);
      },
    );
  }
}
