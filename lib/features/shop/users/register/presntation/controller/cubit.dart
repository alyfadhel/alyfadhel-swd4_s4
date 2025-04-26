import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/shared/const/constanse.dart';
import 'package:swd4_s4/core/shared/network/remote/shop_helper.dart';
import 'package:swd4_s4/features/shop/users/register/data/shop_register_model.dart';
import 'package:swd4_s4/features/shop/users/register/presntation/controller/state.dart';


class ShopRegisterCubit extends Cubit<ShopRegisterStates>
{
  ShopRegisterCubit():super(InitialRegisterState());

  static ShopRegisterCubit get(context)=>BlocProvider.of(context);

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopRegisterChangePasswordVisibilityState());
  }

  ShopRegisterModel? shopRegisterModel;

  void registerUser({
    required String name,
    required String email,
    required String phone,
    required String password,
}){
    emit(ShopRegisterGetUserLoadingState());

    ShopHelper.postData(
        url: registerEndPoint,
        data: {
          'email' : email,
          'name' : name,
          'phone' : phone,
          'password' : password,
        },
        token: token,
    ).then((value){
      shopRegisterModel = ShopRegisterModel.fromJson(value.data);
      emit(ShopRegisterGetUserSuccessState(shopRegisterModel!));
    }).catchError((error){
      emit(ShopRegisterGetUserErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }

}