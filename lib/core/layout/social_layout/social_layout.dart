import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/layout/social_layout/controller/cubit.dart';
import 'package:swd4_s4/core/layout/social_layout/controller/state.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          body: Center(
            child: Text(
              'Social Layout',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        );
      },
    );
  }
}
