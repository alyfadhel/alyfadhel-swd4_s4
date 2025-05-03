abstract class SocialStates{}

class InitialSocialState extends SocialStates{}

class SocialGetUserLoadingState extends SocialStates{}
class SocialGetUserSuccessState extends SocialStates{}
class SocialGetUserErrorState extends SocialStates{
  final String error;

  SocialGetUserErrorState(this.error);
}

class SocialChangeBottomNavState extends SocialStates{}

class SocialUserUpdateLoadingState extends SocialStates{}
class SocialUserUpdateErrorState extends SocialStates{
  final String error;

  SocialUserUpdateErrorState(this.error);
}

// image picker

class SocialProfileImagePickerSuccessState extends SocialStates{}
class SocialProfileImagePickerErrorState extends SocialStates{}

class SocialCoverImagePickerSuccessState extends SocialStates{}
class SocialCoverImagePickerErrorState extends SocialStates{}