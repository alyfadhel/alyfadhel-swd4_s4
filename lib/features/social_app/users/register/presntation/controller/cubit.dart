import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/shared/model/social_user_model.dart';
import 'package:swd4_s4/features/social_app/users/register/presntation/controller/state.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialInitialRegisterState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SocialRegisterChangePasswordVisibilityState());
  }

  void registerUser({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(SocialRegisterUserLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: email,
        password: password
    )
        .then((value) {
          debugPrint(value.user!.email);
          debugPrint(value.user!.uid);
          createUser(
              uId: value.user!.uid,
              name: name,
              email: email,
              phone: phone,
          );
          emit(SocialRegisterUserSuccessState());
        })
        .catchError((error) {
          emit(SocialRegisterUserErrorState(error.toString()));
          debugPrint(error.toString());
        });
  }

  void createUser({
    required String uId,
    required String name,
    required String email,
    required String phone,
  }) {
    SocialUserModel socialUserModel = SocialUserModel(
      uId: uId,
      name: name,
      email: email,
      phone: phone,
      image:
          'https://img.freepik.com/free-photo/people-enjoying-guarana-drink-outdoors_23-2150765629.jpg?t=st=1746037773~exp=1746041373~hmac=60a67e0f4b00d0e65bb5d35e2b6f911b8496348fc115520854453eda977fff36&w=740',
      cover:
          'https://img.freepik.com/free-photo/people-enjoying-guarana-drink-outdoors_23-2150765636.jpg?t=st=1746037744~exp=1746041344~hmac=bab15eaae0cc9931e3c6c8781fd9f46b235ab118beb98a4da14f47bb68c2ec4f&w=740',
      bio: 'Write your bio...',
    );
    emit(SocialCreateUserLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(socialUserModel.toMap())
        .then((value) {
          //emit(SocialCreateUserSuccessState());
    })
        .catchError((error) {
          emit(SocialCreateUserErrorState(error.toString()));
          debugPrint(error.toString());
    });
  }
}
