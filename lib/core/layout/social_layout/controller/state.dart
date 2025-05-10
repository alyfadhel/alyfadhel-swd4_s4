abstract class SocialStates{}

class InitialSocialState extends SocialStates{}

class SocialGetUserLoadingState extends SocialStates{}
class SocialGetUserSuccessState extends SocialStates{}
class SocialGetUserErrorState extends SocialStates{
  final String error;

  SocialGetUserErrorState(this.error);
}

class SocialAllUsersLoadingState extends SocialStates{}
class SocialAllUsersSuccessState extends SocialStates{}
class SocialAllUsersErrorState extends SocialStates{
  final String error;

  SocialAllUsersErrorState(this.error);
}

class SocialChangeBottomNavState extends SocialStates{}
class SocialChangePostPageState extends SocialStates{}

class SocialUserUpdateLoadingState extends SocialStates{}
class SocialUserUpdateErrorState extends SocialStates{
  final String error;

  SocialUserUpdateErrorState(this.error);
}

// profile image picker

class SocialProfileImagePickerSuccessState extends SocialStates{}
class SocialProfileImagePickerErrorState extends SocialStates{}

// uploadProfileImage
class SocialUploadProfileImageSuccessState extends SocialStates{}
class SocialUploadProfileImageErrorState extends SocialStates{}

// cover image picker
class SocialCoverImagePickerSuccessState extends SocialStates{}
class SocialCoverImagePickerErrorState extends SocialStates{}

// uploadCoveImage
class SocialUploadCoverImageSuccessState extends SocialStates{}
class SocialUploadCoverImageErrorState extends SocialStates{}

// create text post

class SocialCreatePostLoadingState extends SocialStates{}
class SocialCreatePostSuccessState extends SocialStates{}
class SocialCreatePostErrorState extends SocialStates{}

// post picker

class SocialPostImagePickerSuccessState extends SocialStates{}
class SocialPostImagePickerErrorState extends SocialStates{}

// create image post

class SocialUploadPostImageSuccessState extends SocialStates{}
class SocialUploadPostImageErrorState extends SocialStates{}

class SocialClosePostState extends SocialStates{}

// get Posts

class SocialGetPostSuccessState extends SocialStates{}
class SocialGetPostErrorState extends SocialStates{}

// get like post

class SocialLikePostSuccessState extends SocialStates{}
class SocialLikePostErrorState extends SocialStates{
  final String error;

  SocialLikePostErrorState(this.error);
}

class SocialSendMessageSuccessState extends SocialStates{}
class SocialSendMessageErrorState extends SocialStates{
  final String error;

  SocialSendMessageErrorState(this.error);
}

class SocialGetMessageSuccessState extends SocialStates{}

