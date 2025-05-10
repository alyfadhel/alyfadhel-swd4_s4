import 'package:flutter/material.dart';
import 'package:swd4_s4/core/layout/social_layout/controller/cubit.dart';
import 'package:swd4_s4/core/shared/model/post_model.dart';
import 'package:swd4_s4/core/shared/themes/styles/icon_broken.dart';

class BuildSocialHomeItem extends StatelessWidget {
  final PostModel model;
  final int index;
  const BuildSocialHomeItem({super.key, required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                    model.image,
                  ),
                ),
                SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          model.name,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(width: 5.0),
                        Icon(Icons.verified, color: Colors.blue, size: 14.0),
                      ],
                    ),
                    Text(
                      model.dateTime,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.more_horiz, size: 16.0),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(height: 1.0, color: Colors.grey),
            ),
            Text(
              model.text,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            if(model.postImage.isNotEmpty)
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    model.postImage,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Iconly_Broken.Heart,
                          color: Colors.red,
                          size: 18.0,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          '${SocialCubit.get(context).likes[index]}',
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall!.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Iconly_Broken.Chat,
                          color: Colors.amber,
                          size: 18.0,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'Comment',
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall!.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(height: 1.0, color: Colors.grey),
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage(
                          SocialCubit.get(context).socialUserModel!.image,
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Text(
                        'Write a comment....',
                        style: Theme.of(
                          context,
                        ).textTheme.titleSmall!.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    SocialCubit.get(context).likePost(SocialCubit.get(context).postId[index]);
                  },
                  child: Row(
                    children: [
                      Icon(Iconly_Broken.Heart, color: Colors.red, size: 18.0),
                      SizedBox(width: 8.0),
                      Text(
                        'Like',
                        style: Theme.of(
                          context,
                        ).textTheme.titleSmall!.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
