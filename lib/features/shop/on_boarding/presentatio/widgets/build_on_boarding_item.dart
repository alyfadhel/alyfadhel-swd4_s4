import 'package:flutter/material.dart';
import 'package:swd4_s4/features/shop/on_boarding/data/on_boarding_model.dart';

class BuildOnBoardingItem extends StatelessWidget {
  final OnBoardingModel model;
  const BuildOnBoardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(
              model.images,
            ),
          ),
        ),
        SizedBox(
          height: 40.0,
        ),
        Text(
          model.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          model.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),

      ],
    );
  }
}
