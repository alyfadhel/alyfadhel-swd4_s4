import 'package:flutter/material.dart';

class SocialChatScreen extends StatelessWidget {
  const SocialChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Social Chat Screen',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
