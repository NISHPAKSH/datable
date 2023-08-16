import 'package:ai4one/utils/color_utils.dart';
import 'package:ai4one/views/screenEffect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai4one/utils/images_utils.dart';

import '../widget/components.dart';

class UnoStartScreen extends StatefulWidget {
  const UnoStartScreen({super.key});

  @override
  State<UnoStartScreen> createState() => UnoStartScreenState();
}

class UnoStartScreenState extends State<UnoStartScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageUtils.backgound1),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 18,
                  ),
                  const Text(
                    "Welcome to the interactive",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      shadows: [
                        Shadow(
                          color: Colors.white, // White shadow color
                          offset: Offset(2, 1), // Offset for shadow position
                          blurRadius: 15.0, // Blur radius for shadow
                        ),
                      ],
                      color: Colors.black,
                      fontSize: 23,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  SizedBox(
                      width: screenWidth / 1.62,
                      // width: 300,
                      child: Text(
                        "UNO",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1,
                            shadows: [
                              Shadow(
                                color: Colors.white, // White shadow color
                                offset:
                                    Offset(2, 1), // Offset for shadow position
                                blurRadius: 15.0, // Blur radius for shadow
                              ),
                            ],
                            letterSpacing: 10,
                            color: Colors.white,
                            fontSize: 100,
                            fontWeight: FontWeight.bold),
                      )),
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      width: screenWidth / 1.4,
                      // width: 250,
                      child: const Text(
                        "- Explore your inner world - ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1,
                            shadows: [
                              Shadow(
                                color: Colors.white, // White shadow color
                                offset:
                                    Offset(2, 1), // Offset for shadow position
                                blurRadius: 15.0, // Blur radius for shadow
                              ),
                            ],
                            color: Color(0xFFBC9D92),
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      )),
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      width: screenWidth / 1.6,
                      // width: 250,
                      child: const Text(
                        'Based on your feedback in "Priorities," "Tactics" and "Mindset" sections, experience a personalized journey of self-discovery.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1,
                            shadows: [
                              Shadow(
                                color: Colors.white38, // White shadow color
                                offset:
                                    Offset(2, 1), // Offset for shadow position
                                blurRadius: 10.0, // Blur radius for shadow
                              ),
                            ],
                            color: Color(0xFF000105),
                            fontSize: 22,
                            wordSpacing: 4,
                            letterSpacing: 1),
                      )),
                  GestureDetector(
                    onTap: () =>Components.fadetopage(()=>ScreenEffect(), context,),


                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        width: screenWidth / 1.5,
                        //width: 240,
                        child: Image(
                          image: AssetImage(ImageUtils.startbutton),
                        )),
                  ),
                ],
              ),
            ),
            Components.homebutton(width: screenWidth, height: screenHeight)
          ],
        ),
      ),
    );
  }
}
