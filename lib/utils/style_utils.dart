import 'package:flutter/material.dart';


import 'color_utils.dart';
import 'font_utils.dart';

class StyleUtils {
  static TextStyle get textLabel400 => TextStyle(
      fontSize: 14, color: ColorUtils.black, fontWeight: FontWeight.w400);

  static TextStyle get textLabel600 => TextStyle(
      fontSize: 14, color: ColorUtils.black, fontWeight: FontWeight.w600);

  static TextStyle get inputTextStyle => TextStyle(
      fontSize: 18,
      color: ColorUtils.black,
      fontFamily: FontUtils.poppinsRegular);

  static TextStyle get appBarTextStyle => TextStyle(
      fontSize: 16,
      color: ColorUtils.black,
      fontFamily: FontUtils.poppinsRegular);

  static TextStyle get labelTextStyle => TextStyle(
      fontSize: 18,
      color: ColorUtils.black,
      fontFamily: FontUtils.poppinsRegular);

  static TextStyle get labelTextStyleMedium => TextStyle(
      fontSize: 18,
      color: ColorUtils.black,
      fontFamily: FontUtils.poppinsMedium);

  static TextStyle get semibold18Black => TextStyle(
      fontSize: 18,
      color: ColorUtils.black,
      fontFamily: FontUtils.poppinsSemiBold);
  static TextStyle get semibold15Black => TextStyle(
      fontSize: 18,
      color: ColorUtils.black,
      fontFamily: FontUtils.poppinsSemiBold);

  static TextStyle get medium18Black => TextStyle(
      fontSize: 18,
      color: ColorUtils.black,
      fontFamily: FontUtils.poppinsMedium);

  static TextStyle get medium18Red => TextStyle(
      fontSize: 18,
      color: ColorUtils.buttonRed,
      fontFamily: FontUtils.poppinsMedium);

  static TextStyle get regular15Red => TextStyle(
      fontSize: 15,
      color: ColorUtils.buttonRed,
      fontFamily: FontUtils.poppinsRegular);

  static TextStyle get regular18Black => TextStyle(
      fontSize: 18,
      color: ColorUtils.black,
      fontFamily: FontUtils.poppinsRegular);

  static TextStyle get medium15Black => TextStyle(
      fontSize: 15,
      color: ColorUtils.black,
      fontFamily: FontUtils.poppinsMedium);

  static TextStyle get labelText25StyleMedium => TextStyle(
      fontSize: 21,
      color: ColorUtils.black,
      fontFamily: FontUtils.poppinsMedium);
  static TextStyle get labelText18StyleSemiBold => TextStyle(
      fontSize: 18,
      color: ColorUtils.black,
      fontFamily: FontUtils.poppinsMedium);

  static TextStyle get copyrightstyle => TextStyle(
      fontSize: 12,
      color: ColorUtils.black,
      fontFamily: FontUtils.poppinsMedium);

  static TextStyle get copyrightstyle1 => TextStyle(
      fontSize: 15,
      color: ColorUtils.black,
      fontFamily: FontUtils.poppinsSemiBold);

  static EdgeInsets get profilePadding =>
      const EdgeInsets.only(left: 25, right: 25);

  static EdgeInsets get marginTB15 =>
      const EdgeInsets.only(top: 15, bottom: 15);

  static EdgeInsets get marginTB5 => const EdgeInsets.only(top: 5, bottom: 5);

  static EdgeInsets get marginTB10 =>
      const EdgeInsets.only(top: 10, bottom: 10);

  static EdgeInsets get marginLTRB5 =>
      const EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 5);

  static EdgeInsets get marginLTRB10 =>
      const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10);

  static EdgeInsets get marginLTRB15 =>
      const EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15);
}
