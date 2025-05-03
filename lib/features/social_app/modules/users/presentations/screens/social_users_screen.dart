import 'package:flutter/material.dart';

class SocialUsersScreen extends StatelessWidget {
  const SocialUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Social Users Screen',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
