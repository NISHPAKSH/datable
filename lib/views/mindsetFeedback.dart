import 'package:flutter/material.dart';
import 'package:ai4one/utils/app_strings.dart';
import 'package:ai4one/utils/images_utils.dart';

import '../widget/components.dart';

class MindsetFeedback extends StatefulWidget {
  const MindsetFeedback({super.key});

  @override
  State<MindsetFeedback> createState() => MindsetFeedbackState();
}

class MindsetFeedbackState extends State<MindsetFeedback> {
  String bg1 = ImageUtils.bgbehavioral;
  String bgbrown = ImageUtils.bgbrown;
  String startbutton = ImageUtils.startbutton;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
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
                toptext: AppStrings.behavioral,
                middletext: AppStrings.mindsetDirections,
                text1: AppStrings.driven,
                text2: AppStrings.absence,
                text3: AppStrings.embraces,
                text4: AppStrings.inhibitions,
                text5: AppStrings.aspects,
              ),
            ),
            Components.homebutton(width: screenWidth, height: screenHeight)
          ],
        ),
      ),
    );
  }
}
