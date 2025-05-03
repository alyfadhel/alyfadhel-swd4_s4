import 'package:flutter/material.dart';
import 'package:swd4_s4/core/shared/themes/styles/icon_broken.dart';

class BuildSocialHomeItem extends StatelessWidget {
  const BuildSocialHomeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                    'https://img.freepik.com/premium-photo/child-stretches-his-hands-sunlight-outside-window-flying-dove-world-with-branch-forces-globe-concept-peace-world-no-war-ecology_73683-3274.jpg?w=740',
                  ),
                ),
                SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Aly Fadhel Hassan',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(width: 5.0),
                        Icon(Icons.verified, color: Colors.blue, size: 14.0),
                      ],
                    ),
                    Text(
                      'May,03,2025',
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
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Container(
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
                          'Like',
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
                          'https://img.freepik.com/free-photo/man-sitting-rock_417767-361.jpg?t=st=1746291792~exp=1746295392~hmac=9fb6ea14b60e102b8c9b68786ab718c939cf8e1150bd103ffc98775085591fe7&w=740',
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
                Row(
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
              ],
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
