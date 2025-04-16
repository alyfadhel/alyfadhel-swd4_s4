import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/shared/const/constanse.dart';
import 'package:swd4_s4/core/shared/network/remote/shop_helper.dart';
import 'package:swd4_s4/features/shop/users/login/data/shop_login_model.dart';
import 'package:swd4_s4/features/shop/users/login/presntation/controller/state.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>
{
  ShopLoginCubit():super(InitialLoginState());

  static ShopLoginCubit get(context)=>BlocProvider.of(context);

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopLoginChangePasswordVisibilityState());
  }

  ShopLoginModel? shopLoginModel;

  void getUser({
    required String email,
    required String password,
})
  {
    emit(ShopLoginGetUserLoadingState());

    ShopHelper.postData(
      url: loginEndPoint,
      data:
      {
        'email' : email,
        'password' : password,
      },
    ).then((value){
      shopLoginModel = ShopLoginModel.fromJson(value.data);
      debugPrint('The user is: ${value.data}');
      emit(ShopLoginGetUserSuccessState(shopLoginModel!));
    }).catchError((error){
      emit(ShopLoginGetUserErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }
}