

abstract class SocialRegisterStates{}

class SocialInitialRegisterState extends SocialRegisterStates{}

class SocialRegisterChangePasswordVisibilityState extends SocialRegisterStates{}

class SocialRegisterUserLoadingState extends SocialRegisterStates{}
class SocialRegisterUserSuccessState extends SocialRegisterStates{}
class SocialRegisterUserErrorState extends SocialRegisterStates{
  final String error;

  SocialRegisterUserErrorState(this.error);
}

class SocialCreateUserLoadingState extends SocialRegisterStates{}
class SocialCreateUserSuccessState extends SocialRegisterStates{}
class SocialCreateUserErrorState extends SocialRegisterStates{
  final String error;

  SocialCreateUserErrorState(this.error);
}