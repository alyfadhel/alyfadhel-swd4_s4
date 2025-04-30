import 'package:swd4_s4/features/shop/users/login/data/shop_login_model.dart';

abstract class SocialLoginStates{}

class SocialInitialLoginState extends SocialLoginStates{}

class SocialLoginChangePasswordVisibilityState extends SocialLoginStates{}

class SocialLoginUserLoadingState extends SocialLoginStates{}
class SocialLoginUserSuccessState extends SocialLoginStates{
  final String uId;

  SocialLoginUserSuccessState(this.uId);
}
class SocialLoginUserErrorState extends SocialLoginStates{
  final String error;

  SocialLoginUserErrorState(this.error);
}