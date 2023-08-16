import 'package:ai4one/model/tactics.dart';
import 'package:ai4one/views/home.dart';
import 'package:ai4one/widget/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai4one/utils/app_strings.dart';
import 'package:ai4one/utils/images_utils.dart';

import '../database/dbhelper.dart';

class TacticsFeedback extends StatefulWidget {
  const TacticsFeedback({super.key});

  @override
  State<TacticsFeedback> createState() => TacticsFeedbackState();
}

class TacticsFeedbackState extends State<TacticsFeedback> {
  //final controller = Get.put(OnboardController());


  String bg1 = ImageUtils.bgTacticscrop;
  String bgbrown = ImageUtils.bgbrown;
  String centerCont = ImageUtils.centerCont;
  String startbutton = ImageUtils.startbutton;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bg1),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Components.feedbackContent(
                width: screenWidth,
                height: screenHeight,
                toptext: AppStrings.prestrategies,
                middletext: AppStrings.topstrategies,
                text1: AppStrings.seeking,
                text2: AppStrings.honestyconflicts,
                text3: AppStrings.adapts,
                text4: AppStrings.situations,
                text5: AppStrings.problems,
              ),
            ),
            Components.homebutton(width: screenWidth, height: screenHeight)
          ],
        ),
      ),
    );
  }
}
