import 'package:ai4one/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai4one/utils/images_utils.dart';
import 'package:ai4one/views/screenYesno.dart';

import '../widget/components.dart';

class ScreenCont extends StatefulWidget {
  const ScreenCont({super.key});

  @override
  State<ScreenCont> createState() => ScreenContState();
}

class ScreenContState extends State<ScreenCont> {
  //final controller = Get.put(OnboardController());

  String bg1 = ImageUtils.coreBackgoundCont;
  String bg2 = ImageUtils.coreBackgound3;
  String centerCont = ImageUtils.centerCont;
  String continueb = ImageUtils.continueb;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () {
        Get.to(ScreenYesno());
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
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                  width: screenWidth / 1.07,
                 // width: 350,
                  child: Image(
                    image: AssetImage(ImageUtils.centerCont),
                  )),
              GestureDetector(
                onTap: () => {
                  setState(() {
                    bg1 = bg2;
                  }),
                  Future.delayed(Duration(milliseconds: 500), () {
                    //  Get.to(LifePriorities());
                  }),
                },
                child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    width: screenWidth * .90,
                    child: Image(
                      image: AssetImage(continueb),
                    )),
              ),
              Expanded(child: SizedBox()),
              Components.homebutton(width:screenWidth,height: screenHeight)
            ],
          ),
        ),
      ),
    );
  }
}
