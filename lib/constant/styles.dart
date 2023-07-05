import 'package:flutter/material.dart';
import 'package:test_flutter_developer/constant/colors.dart';

class AppStyles {
  AppStyles._();

  static TextStyle textStyleAppBar() => const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );

  static TextStyle styleTextBody12({
    Color? colorText,
    double? size = 12,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        color: colorText ?? AppColors.green,
        fontSize: 12,
        fontWeight: fontWeight,
      );
  static TextStyle styleTextBody14({
    Color? colorText,
    double? size = 14,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        color: colorText ?? AppColors.black,
        fontSize: 14,
        fontWeight: fontWeight,
      );
  static TextStyle styleTextBody18({
    Color? colorText,
    double? size = 18,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        color: colorText ?? AppColors.green,
        fontSize: 18,
        fontWeight: fontWeight,
      );
  static TextStyle styleTextBody16({
    Color? colorText,
    double? size = 16,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        color: colorText ?? AppColors.white,
        fontSize: 16,
        fontWeight: fontWeight,
      );
  static TextStyle styleTextBody20({
    Color? colorText,
    double? size = 20,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        color: colorText ?? AppColors.black,
        fontSize: 20,
        fontWeight: fontWeight,
      );
  static TextStyle styleTextBody38({
    Color? colorText,
    double? size = 38,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        color: colorText ?? AppColors.green,
        fontSize: size,
        fontWeight: fontWeight,
      );

  static InputDecoration inputDecoration(String label, {Widget? suffixIcon, bool? disableLabel}) => InputDecoration(
        labelText: label,
        labelStyle: AppStyles.styleTextBody18(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: suffixIcon,
        suffixIconColor: AppColors.green,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      );
}
