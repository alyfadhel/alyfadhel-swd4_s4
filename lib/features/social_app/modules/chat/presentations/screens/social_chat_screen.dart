import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/layout/social_layout/controller/cubit.dart';
import 'package:swd4_s4/core/layout/social_layout/controller/state.dart';
import 'package:swd4_s4/core/shared/model/social_user_model.dart';
import 'package:swd4_s4/features/social_app/modules/chat/presentations/widgets/build_users_item.dart';

class SocialChatScreen extends StatelessWidget {
  const SocialChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.users.isNotEmpty,
          builder:
              (context) => ListView.separated(
                itemBuilder: (context, index) => BuildUsersItem(model: cubit.users[index]),
                separatorBuilder: (context, index) => SizedBox(
                  height: 20.0,
                ),
                itemCount: cubit.users.length,
              ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}


