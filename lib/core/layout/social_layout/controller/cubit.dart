import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swd4_s4/core/layout/social_layout/controller/state.dart';
import 'package:swd4_s4/core/shared/const/constanse.dart';
import 'package:swd4_s4/core/shared/model/message_model.dart';
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
  var messageController = TextEditingController();

  int currentIndex = 0;

  void changeBottomNav(index) {
    if(index == 3){
      getAllUsers();
    }
    if (index == 2) {
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

  List<PostModel> posts = [];
  List<String> postId = [];
  List<int> likes = [];

  void getPosts() {
    FirebaseFirestore.instance
        .collection('posts')
        .get()
        .then((value) {
          value.docs.forEach((element) {
            element.reference
                .collection('likes')
                .get()
                .then((value) {
                  likes.add(value.docs.length);
                  postId.add(element.id);
                  posts.add(PostModel.fromJson(element.data()));
                })
                .catchError((error) {
                  emit(SocialGetPostErrorState());
                });
          });
          emit(SocialGetPostSuccessState());
        })
        .catchError((error) {
          emit(SocialGetPostErrorState());
        });
  }

  void likePost(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(socialUserModel!.uId)
        .set({'like': true})
        .then((value) {
          emit(SocialLikePostSuccessState());
        })
        .catchError((error) {
          emit(SocialLikePostErrorState(error.toString()));
          debugPrint(error.toString());
        });
  }

  List<SocialUserModel> users = [];

  void getAllUsers() {
    users = [];
    emit(SocialAllUsersLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value) {
          value.docs.forEach((element) {
            if (element.data()['uId'] != socialUserModel!.uId) {
              users.add(SocialUserModel.fromJson(element.data()));
            }
            emit(SocialAllUsersSuccessState());
          });
        })
        .catchError((error) {
          emit(SocialAllUsersErrorState(error.toString()));
          debugPrint(error.toString());
        });
  }

  void sendMessage({
    required String receiverId,
    required String dateTime,
    required String text,
  }) {
    MessageModel model = MessageModel(
      senderId: socialUserModel!.uId,
      receiverId: receiverId,
      dateTime: dateTime,
      text: text,
    );
    // set my message
    FirebaseFirestore.instance
        .collection('users')
        .doc(socialUserModel!.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
          messageController.clear();
          emit(SocialSendMessageSuccessState());
        })
        .catchError((error) {
          emit(SocialSendMessageErrorState(error.toString()));
          debugPrint(error.toString());
        });

    // set receiver chat

    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(socialUserModel!.uId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
          emit(SocialSendMessageSuccessState());
        })
        .catchError((error) {
          emit(SocialSendMessageErrorState(error.toString()));
          debugPrint(error.toString());
        });
  }

  List<MessageModel> messages = [];

  void getMessages({required String receiverId}) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(socialUserModel!.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages = [];
      event.docs.forEach((element){
        messages.add(MessageModel.fromJson(element.data()));
      });
      emit(SocialGetMessageSuccessState());
    });
  }
}
