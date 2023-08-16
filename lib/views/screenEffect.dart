import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai4one/utils/images_utils.dart';
import 'package:ai4one/views/screenYesno.dart';

import '../widget/components.dart';

class ScreenEffect extends StatefulWidget {
  const ScreenEffect({super.key});

  @override
  State<ScreenEffect> createState() => ScreenEffectState();
}

class ScreenEffectState extends State<ScreenEffect> {
  //final controller = Get.put(OnboardController());

  @override
  void initState() {
    super.initState();
    // Introduce a delay of 2 seconds

    Future.delayed(const Duration(milliseconds: 500), () {
      // Navigate to the main screen after the delay
      setState(() {
        bg1 = bg2;
      });
      Future.delayed(Duration(seconds: 1), () {
        //Get.to(ScreenYesno());
        Components.fadetopage(()=>ScreenYesno(), context,);
      });
    }
    );
  }

  String bg1 = ImageUtils.coreBackgound;
  String bg2 = ImageUtils.coreBackgound2;

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
            SizedBox(
              width: screenWidth/1.07,
               // width: 350,
                child: Image(
                  image: AssetImage(ImageUtils.center),
                )),
            const Expanded(child: SizedBox()),
            Components.homebutton(width:screenWidth,height: screenHeight),
          ],
        ),
      ),
    );
  }
}
