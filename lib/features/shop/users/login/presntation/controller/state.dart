import 'package:swd4_s4/features/shop/users/login/data/shop_login_model.dart';

abstract class ShopLoginStates{}

class InitialLoginState extends ShopLoginStates{}

class ShopLoginChangePasswordVisibilityState extends ShopLoginStates{}

class ShopLoginGetUserLoadingState extends ShopLoginStates{}
class ShopLoginGetUserSuccessState extends ShopLoginStates{
  final ShopLoginModel shopLoginModel;

  ShopLoginGetUserSuccessState(this.shopLoginModel);
}
class ShopLoginGetUserErrorState extends ShopLoginStates{
  final String error;

  ShopLoginGetUserErrorState(this.error);
}