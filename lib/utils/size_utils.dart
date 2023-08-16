
import 'package:flutter/material.dart';

class SizeUtils {

  static double widthInRatio(BuildContext context, double ratio){
    var width = MediaQuery.of(context).size.width;
    return (width * ratio);
  }

  static double heightInRatio(BuildContext context, double ratio){
    var height = MediaQuery.of(context).size.height;
    return (height * ratio);
  }

  static double getStatusBarHeight(BuildContext context){
    var top = MediaQuery.of(context).viewPadding.top;
    return top;
  }


}