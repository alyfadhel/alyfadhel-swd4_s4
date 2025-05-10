import 'package:flutter/material.dart';
import 'package:swd4_s4/core/shared/model/social_user_model.dart';
import 'package:swd4_s4/features/social_app/modules/chat/presentations/screens/social_chat_details_screen.dart';

class BuildUsersItem extends StatelessWidget {
  final SocialUserModel model;

  const BuildUsersItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SocialChatDetailsScreen(socialUserModel: model,)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage(model.image),
            ),
            SizedBox(width: 20.0),
            Text(model.name, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
