import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swd4_s4/core/layout/social_layout/controller/state.dart';
import 'package:swd4_s4/core/shared/const/constanse.dart';
import 'package:swd4_s4/core/shared/model/post_model.dart';
import 'package:swd4_s4/core/shared/model/social_user_model.dart';
import 'package:swd4_s4/core/shared/themes/styles/icon_broken.dart';
import 'package:swd4_s4/features/social_app/modules/chat/presentations/screens/social_chat_screen.dart';
import 'package:swd4_s4/features/social_app/modules/home/presentations/screens/social_home_screen.dart';
import 'package:swd4_s4/features/social_app/modules/post/presentation/screens/post_screen.dart';
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
    BottomNavigationBarItem(
      icon: Icon(Iconly_Broken.Paper_Upload),
      label: 'Post',
    ),
    BottomNavigationBarItem(icon: Icon(Iconly_Broken.User), label: 'Users'),
    BottomNavigationBarItem(
      icon: Icon(Iconly_Broken.Setting),
      label: 'Settings',
    ),
  ];

  List<String> titles = ['Home', 'Chat', 'Post', 'Users', 'Settings'];

  List<Widget> screens = [
    SocialHomeScreen(),
    SocialChatScreen(),
    PostScreen(),
    SocialUsersScreen(),
    SocialSettingsScreen(),
  ];
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var bioController = TextEditingController();
  var textController = TextEditingController();

  int currentIndex = 0;

  void changeBottomNav(index) {
    if (index == 2)
    {
      emit(SocialChangePostPageState());
    } else {
      currentIndex = index;
      emit(SocialChangeBottomNavState());
    }
  }

  File? profileImage;
  final picker = ImagePicker();

  Future getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      debugPrint('The path is: ${pickedFile.path}');
      emit(SocialProfileImagePickerSuccessState());
    } else {
      debugPrint('No image selected');
      emit(SocialProfileImagePickerErrorState());
    }
  }

  void uploadProfileImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());
    FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
          value.ref
              .getDownloadURL()
              .then((value) {
                updateUser(name: name, phone: phone, bio: bio, image: value);
              })
              .catchError((error) {
                emit(SocialUploadProfileImageErrorState());
              });
          emit(SocialUploadProfileImageSuccessState());
        })
        .catchError((error) {
          emit(SocialUploadProfileImageErrorState());
        });
  }

  File? coverImage;

  Future getCoverImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(SocialCoverImagePickerSuccessState());
    } else {
      debugPrint('No image selected');
      emit(SocialCoverImagePickerErrorState());
    }
  }

  void uploadCoverImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());
    FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
          value.ref
              .getDownloadURL()
              .then((value) {
                updateUser(name: name, phone: phone, bio: bio, cover: value);
              })
              .catchError((error) {
                emit(SocialUploadCoverImageErrorState());
              });
          emit(SocialUploadCoverImageSuccessState());
        })
        .catchError((error) {
          emit(SocialUploadCoverImageErrorState());
        });
  }

  void updateUser({
    required String name,
    required String phone,
    required String bio,
    String? image,
    String? cover,
  }) {
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

  File? postImage;

  Future getPostImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(SocialPostImagePickerSuccessState());
    } else {
      debugPrint('No image selected');
      emit(SocialPostImagePickerErrorState());
    }
  }

  void uploadPostImage({required String dateTime, required String text}) {
    emit(SocialUserUpdateLoadingState());
    FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
          value.ref
              .getDownloadURL()
              .then((value) {
                createPost(dateTime: dateTime, text: text, postImage: value);
                removePost();
              })
              .catchError((error) {
                emit(SocialUploadPostImageErrorState());
              });

          emit(SocialUploadPostImageSuccessState());
        })
        .catchError((error) {
          emit(SocialUploadPostImageErrorState());
        });
  }

  void removePost() {
    postImage = null;
    emit(SocialClosePostState());
  }

  void createPost({
    required String dateTime,
    required String text,
    String? postImage,
  }) {
    PostModel model = PostModel(
      name: socialUserModel!.name,
      uId: socialUserModel!.uId,
      image: socialUserModel!.image,
      dateTime: dateTime,
      text: text,
      postImage: postImage ?? '',
    );
    emit(SocialUserUpdateLoadingState());
    FirebaseFirestore.instance
        .collection('posts')
        .add(model.toMap())
        .then((value) {
          textController.clear();
          getPosts();
          debugPrint('The posts : ${value.toString()}');
          emit(SocialCreatePostSuccessState());
        })
        .catchError((error) {
          emit(SocialCreatePostErrorState());
        });
  }

  List<PostModel>posts = [];
  void getPosts() {
    FirebaseFirestore.instance
        .collection('posts')
        .get()
        .then((value) {
          value.docs.forEach((element){
            posts.add(PostModel.fromJson(element.data()));
          });
          emit(SocialGetPostSuccessState());
    })
        .catchError((error) {
          emit(SocialGetPostErrorState());
    });
  }
}

///data/user/0/com.example.swd4_s4/cache/d3171981-b3c7-4e51-9093-45adea95a4e5/f8641b93-8571-4255-a803-7c1478d9523c-1_all_2.jpg
