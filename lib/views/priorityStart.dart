import 'package:ai4one/views/home.dart';
import 'package:ai4one/widget/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai4one/utils/app_strings.dart';
import 'package:ai4one/utils/images_utils.dart';
import 'package:ai4one/views/priorityQuestion.dart';

class PriorityStart extends StatefulWidget {
  const PriorityStart({super.key});

  @override
  State<PriorityStart> createState() => PriorityStartState();
}

class PriorityStartState extends State<PriorityStart> {
  //final controller = Get.put(OnboardController());

  String bg1 = ImageUtils.skybg;
  String bgbrown = ImageUtils.bgbrown;
  String centerCont = ImageUtils.centerCont;
  String startbutton = ImageUtils.startbutton;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () {
        Get.to(const Home());
        return Future(() => true);
      },
      child: Scaffold(
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
                  child: Components.startContent(
                width: screenWidth,
                height: screenHeight,
                text1: AppStrings.vitaCore,
                text2: AppStrings.lifePriorities,
                text3: AppStrings.asyougrow,
                onTap: () => {Get.to(PriorityQuestion())},
              )),
              Components.homebutton(width: screenWidth, height: screenHeight)
            ],
          ),
        ),
      ),
    );
  }
}
