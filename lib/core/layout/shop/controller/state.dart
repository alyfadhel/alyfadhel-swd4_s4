import 'package:swd4_s4/features/shop/home/data/model/change_favorites_model.dart';
import 'package:swd4_s4/features/shop/settings/data/model/update_profile_model.dart';

abstract class ShopStates{}

class InitialShoState extends ShopStates{}

class ShopChangeBottomNavState extends ShopStates{}

class ShopGetHomeLoadingState extends ShopStates{}
class ShopGetHomeSuccessState extends ShopStates{}
class ShopGetHomeErrorState extends ShopStates{
  final String error;

  ShopGetHomeErrorState(this.error);
}

class ShopGetCategoriesHomeLoadingState extends ShopStates{}
class ShopGetCategoriesHomeSuccessState extends ShopStates{}
class ShopGetCategoriesHomeErrorState extends ShopStates{
  final String error;

  ShopGetCategoriesHomeErrorState(this.error);
}

class ShopChangeFavoritesLoadingState extends ShopStates{}
class ShopChangeFavoritesSuccessState extends ShopStates{
  final ChangeFavoritesModel changeFavoritesModel;

  ShopChangeFavoritesSuccessState(this.changeFavoritesModel);
}
class ShopChangeFavoritesErrorState extends ShopStates{
  final String error;

  ShopChangeFavoritesErrorState(this.error);
}

class ShopGetFavoritesLoadingState extends ShopStates{}
class ShopGetFavoritesSuccessState extends ShopStates{}
class ShopGetFavoritesErrorState extends ShopStates{
  final String error;

  ShopGetFavoritesErrorState(this.error);
}

class ShopGetProfileLoadingState extends ShopStates{}
class ShopGetProfileSuccessState extends ShopStates{}
class ShopGetProfileErrorState extends ShopStates{
  final String error;

  ShopGetProfileErrorState(this.error);
}

class ShopGetUpdateProfileLoadingState extends ShopStates{}
class ShopGetUpdateProfileSuccessState extends ShopStates{
  final UpdateProfileModel? updateProfileModel;

  ShopGetUpdateProfileSuccessState(this.updateProfileModel);
}
class ShopGetUpdateProfileErrorState extends ShopStates{
  final String error;

  ShopGetUpdateProfileErrorState(this.error);
}

class ShopGetProductDetailsLoadingState extends ShopStates{}
class ShopGetProductDetailsSuccessState extends ShopStates{}
class ShopGetProductDetailsErrorState extends ShopStates{
  final String error;

  ShopGetProductDetailsErrorState(this.error);
}

class ShopChangeSmoothIndicatorState extends ShopStates{}

class ShopChangeLanguageState extends ShopStates{}

class ShopGetSearchLoadingState extends ShopStates{}
class ShopGetSearchSuccessState extends ShopStates{}
class ShopGetSearchErrorState extends ShopStates{
  final String error;

  ShopGetSearchErrorState(this.error);
}

