
import 'package:swd4_s4/features/shop/users/register/data/shop_register_model.dart';

abstract class ShopRegisterStates{}

class InitialRegisterState extends ShopRegisterStates{}

class ShopRegisterChangePasswordVisibilityState extends ShopRegisterStates{}

class ShopRegisterGetUserLoadingState extends ShopRegisterStates{}
class ShopRegisterGetUserSuccessState extends ShopRegisterStates{
  final ShopRegisterModel? shopRegisterModel;

  ShopRegisterGetUserSuccessState(this.shopRegisterModel);
}
class ShopRegisterGetUserErrorState extends ShopRegisterStates{
  final String error;

  ShopRegisterGetUserErrorState(this.error);
}