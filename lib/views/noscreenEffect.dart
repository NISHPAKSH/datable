import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai4one/utils/images_utils.dart';
import 'package:ai4one/views/screenCont.dart';
import 'package:ai4one/views/screenYesno.dart';

class noscreenEffect extends StatefulWidget {
  @override
  State<noscreenEffect> createState() => noscreenEffectState();
}

class noscreenEffectState extends State<noscreenEffect> {
  //final controller = Get.put(OnboardController());
  void initState() {
    super.initState();
    // Introduce a delay of 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to the main screen after the delay
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ScreenCont()),
      );
    });
  }

  String redEffect = ImageUtils.redEffect;

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
            image: AssetImage(redEffect),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
