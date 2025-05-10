import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/layout/social_layout/controller/cubit.dart';
import 'package:swd4_s4/core/layout/social_layout/controller/state.dart';
import 'package:swd4_s4/core/shared/model/message_model.dart';
import 'package:swd4_s4/core/shared/model/social_user_model.dart';
import 'package:swd4_s4/core/shared/themes/controller/cubit.dart';
import 'package:swd4_s4/core/shared/themes/styles/icon_broken.dart';

class SocialChatDetailsScreen extends StatelessWidget {
  final SocialUserModel socialUserModel;

  const SocialChatDetailsScreen({super.key, required this.socialUserModel});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        SocialCubit.get(context).getMessages(receiverId: socialUserModel.uId);
        return BlocConsumer<SocialCubit, SocialStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = SocialCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Iconly_Broken.Arrow___Left_2),
                ),
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                        cubit.socialUserModel!.image,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      cubit.socialUserModel!.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              body: ConditionalBuilder(
                condition: cubit.messages.isNotEmpty,
                builder:
                    (context) => Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                var message =
                                    SocialCubit.get(context).messages[index];
                                if (SocialCubit.get(
                                      context,
                                    ).socialUserModel!.uId ==
                                    message.senderId) {
                                  return buildMyMessage(context, message);
                                } else {
                                  return buildMessage(context, message);
                                }
                              },
                              separatorBuilder:
                                  (context, index) => SizedBox(height: 20.0),
                              itemCount:
                                  SocialCubit.get(context).messages.length,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ),
                                    child: TextFormField(
                                      style: TextStyle(
                                        color: ThemeModeCubit.get(context).isDark ? Colors.black : Colors.white,
                                      ),
                                      controller: cubit.messageController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Type your message ...',
                                      ),
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    SocialCubit.get(context).sendMessage(
                                      receiverId: socialUserModel.uId,
                                      dateTime: DateTime.now().toString(),
                                      text:
                                          SocialCubit.get(
                                            context,
                                          ).messageController.text,
                                    );
                                  },
                                  height: 50.0,
                                  color: Colors.blue,
                                  minWidth: 1.0,
                                  child: Icon(
                                    Iconly_Broken.Send,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                fallback:
                    (context) => Center(child: CircularProgressIndicator()),
              ),
            );
          },
        );
      },
    );
  }
}

Widget buildMessage(context, MessageModel model) => Align(
  alignment: AlignmentDirectional.topStart,
  child: Container(
    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    decoration: BoxDecoration(
      color: Colors.blue.shade200,
      borderRadius: BorderRadiusDirectional.only(
        topStart: Radius.circular(10.0),
        topEnd: Radius.circular(10.0),
        bottomEnd: Radius.circular(10.0),
      ),
    ),
    child: Text(model.text, style: Theme.of(context).textTheme.titleMedium),
  ),
);

Widget buildMyMessage(context, MessageModel model) => Align(
  alignment: AlignmentDirectional.topEnd,
  child: Container(
    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    decoration: BoxDecoration(
      color: Colors.green.shade200,
      borderRadius: BorderRadiusDirectional.only(
        topStart: Radius.circular(10.0),
        topEnd: Radius.circular(10.0),
        bottomStart: Radius.circular(10.0),
      ),
    ),
    child: Text(model.text, style: Theme.of(context).textTheme.titleMedium),
  ),
);
