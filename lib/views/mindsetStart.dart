import 'package:ai4one/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai4one/utils/app_strings.dart';
import 'package:ai4one/utils/images_utils.dart';
import '../widget/components.dart';
import 'mindsetQuestion.dart';

class MindsetStart extends StatefulWidget {
  const MindsetStart({super.key});

  @override
  State<MindsetStart> createState() => MindsetStartState();
}

class MindsetStartState extends State<MindsetStart> {
  //final controller = Get.put(OnboardController());

  String bg1 = ImageUtils.bgbehavioral;
  String centerCont = ImageUtils.centerCont;
  String startbutton = ImageUtils.startbutton;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () {
        Get.to(Home());
        return Future(() => true);
      },
      child: Scaffold(
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
                  child: Components.startContent(
                    width:screenWidth,height:screenHeight,
                text1: AppStrings.vitaCore,
                text2: AppStrings.mindset,
                text3: AppStrings.strategies,
                onTap: () => {Get.to(MindsetQuestion())},
              )),
              Components.homebutton(width:screenWidth,height: screenHeight)
            ],
          ),
        ),
      ),
    );
  }
}
