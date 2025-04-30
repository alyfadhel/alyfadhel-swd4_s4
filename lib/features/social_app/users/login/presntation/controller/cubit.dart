import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/shared/const/constanse.dart';
import 'package:swd4_s4/core/shared/network/remote/shop_helper.dart';
import 'package:swd4_s4/features/shop/users/login/data/shop_login_model.dart';
import 'package:swd4_s4/features/shop/users/login/presntation/controller/state.dart';
import 'package:swd4_s4/features/social_app/users/login/presntation/controller/state.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates> {
  SocialLoginCubit() : super(SocialInitialLoginState());

  static SocialLoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SocialLoginChangePasswordVisibilityState());
  }

  void getUser({required String email, required String password}) {
    emit(SocialLoginUserLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
          debugPrint(value.user!.email);
          debugPrint(value.user!.uid);
          emit(SocialLoginUserSuccessState(value.user!.uid));
    })
        .catchError((error) {
          emit(SocialLoginUserErrorState(error.toString()));
          debugPrint(error.toString());
    });
  }
}
