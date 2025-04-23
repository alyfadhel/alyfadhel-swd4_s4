import 'package:flutter/material.dart';
import 'package:swd4_s4/core/shared/themes/controller/cubit.dart';

class MyFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final IconData prefix;
  final IconData? suffix;
  final String text;
  final bool isUpperCase;
  final TextStyle? style;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool isPassword;
  final Function()? onSuffixPressed;

  const MyFormField({
    super.key,
    required this.controller,
    required this.type,
    required this.prefix,
    this.suffix,
    required this.text,
    this.isUpperCase = true,
    this.style,
    this.onTap,
    this.onFieldSubmitted,
    this.validator,
    this.onChanged,
    this.isPassword = false,
    this.onSuffixPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: ThemeModeCubit.get(context).isDark ? Colors.black : Colors.white,
      ),
      controller: controller,
      keyboardType: type,
      onTap: onTap,
      obscureText: isPassword,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          borderSide: BorderSide(
            color: ThemeModeCubit.get(context).isDark ? Colors.black : Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        prefixIcon: Icon(
          prefix,
          color: ThemeModeCubit.get(context).isDark ? Colors.black : Colors.white,
        ),
        label: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: style,
        ),
        suffixIcon: suffix != null
            ? IconButton(onPressed: onSuffixPressed, icon: Icon(suffix))
            : null,
      ),
    );
  }
}
