import 'package:swd4_s4/features/shop/home/data/model/change_favorites_model.dart';

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

