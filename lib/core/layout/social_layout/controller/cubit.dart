import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swd4_s4/core/layout/social_layout/controller/state.dart';
import 'package:swd4_s4/core/shared/const/constanse.dart';
import 'package:swd4_s4/core/shared/model/social_user_model.dart';
import 'package:swd4_s4/core/shared/themes/styles/icon_broken.dart';
import 'package:swd4_s4/features/social_app/modules/chat/presentations/screens/social_chat_screen.dart';
import 'package:swd4_s4/features/social_app/modules/home/presentations/screens/social_home_screen.dart';
import 'package:swd4_s4/features/social_app/modules/settings/presentations/screens/social_settings_screen.dart';
import 'package:swd4_s4/features/social_app/modules/users/presentations/screens/social_users_screen.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(InitialSocialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  SocialUserModel? socialUserModel;

  void getUser() {
    emit(SocialGetUserLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
          socialUserModel = SocialUserModel.fromJson(value.data()!);
          debugPrint('The User is: ${value.data()}');
          emit(SocialGetUserSuccessState());
        })
        .catchError((error) {
          emit(SocialGetUserErrorState(error.toString()));
          debugPrint(error.toString());
        });
  }

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Iconly_Broken.Home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Iconly_Broken.Chat), label: 'Chat'),
    BottomNavigationBarItem(icon: Icon(Iconly_Broken.User), label: 'Users'),
    BottomNavigationBarItem(
      icon: Icon(Iconly_Broken.Setting),
      label: 'Settings',
    ),
  ];

  List<String> titles = ['Home', 'Chat', 'Users', 'Settings'];

  List<Widget> screens = [
    SocialHomeScreen(),
    SocialChatScreen(),
    SocialUsersScreen(),
    SocialSettingsScreen(),
  ];
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var bioController = TextEditingController();

  int currentIndex = 0;

  void changeBottomNav(index) {
    currentIndex = index;
    emit(SocialChangeBottomNavState());
  }

  File? profileImage;
  final picker = ImagePicker();

  Future getProfileImage()async
  {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      profileImage = File(pickedFile.path);
      emit(SocialProfileImagePickerSuccessState());
    }else{
      debugPrint('No image selected');
      emit(SocialProfileImagePickerErrorState());
    }
  }

  File? coverImage;
  Future getCoverImage()async
  {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      coverImage = File(pickedFile.path);
      emit(SocialCoverImagePickerSuccessState());
    }else{
      debugPrint('No image selected');
      emit(SocialCoverImagePickerErrorState());
    }
  }

  void updateUser({
    required String name,
    required String phone,
    required String bio,
    String? image,
    String? cover,
  })
  {
    SocialUserModel model = SocialUserModel(
        uId: socialUserModel!.uId,
        name: name,
        email: socialUserModel!.email,
        phone: phone,
        image: image ?? socialUserModel!.image,
        cover: cover ?? socialUserModel!.cover,
        bio: bio,
    );
    emit(SocialUserUpdateLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(socialUserModel!.uId)
        .update(model.toMap())
        .then((value) {
          getUser();
    })
        .catchError((error) {
          emit(SocialUserUpdateErrorState(error.toString()));
          debugPrint(error.toString());
    });
  }
}
