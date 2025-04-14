import 'package:flutter/material.dart';
import 'package:swd4_s4/features/messenger/data/model/messenge_model.dart';

class BuildChat extends StatelessWidget {
  final MessengerModel model;

  const BuildChat({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
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
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                model.body,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        CircleAvatar(
          radius: 5.0,
          backgroundColor: Colors.blue,
        ),
        SizedBox(
          width: 8.0,
        ),
        Text(
          '02:00 pm',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
