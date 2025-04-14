import 'package:flutter/material.dart';
import 'package:swd4_s4/features/messenger/data/model/messenge_model.dart';

class BuildStory extends StatelessWidget {
  final MessengerModel model;

  const BuildStory({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 35.0,
                backgroundImage: NetworkImage(
                  model.image,
                ),
              ),
              CircleAvatar(
                radius: 10.0,
                child: CircleAvatar(
                  radius: 8.0,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            model.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
