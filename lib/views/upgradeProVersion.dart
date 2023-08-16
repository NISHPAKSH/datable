import 'package:ai4one/utils/color_utils.dart';
import 'package:ai4one/widget/components.dart';
import 'package:flutter/material.dart';
import 'package:ai4one/utils/app_strings.dart';
import 'package:ai4one/utils/images_utils.dart';

class UpgradeProVersion extends StatefulWidget {
  const UpgradeProVersion({super.key});

  @override
  State<UpgradeProVersion> createState() => PpgradeProVersionState();
}

class PpgradeProVersionState extends State<UpgradeProVersion> {
  //final controller = Get.put(OnboardController());

  String bg1 = ImageUtils.bgenergy;
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
            Container(
                child: Transform(
                    transform: Matrix4.identity()
                      ..scale(1.0,
                          1.8), // Adjust the vertical scale (2.0 for double height)
                    alignment: Alignment.center,
                    child: Text(
                      AppStrings.upgradePro,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        shadows: [
                          Shadow(color: ColorUtils.white, blurRadius: 5)
                        ],
                        fontFamily: 'MyriadPro-Regular',
                        fontSize: screenWidth / 15,
                        //fontSize: 27,
                        color: const Color(0xff000000),
                      ),
                    ))),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(50, 50, 50, 0),
                width: screenWidth / 1.5,
                // width: 250,
                child: Column(
                  children: [
                    Text(
                      AppStrings.yoursession,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        shadows: [
                          Shadow(color: Colors.white70, blurRadius: 10)
                        ],
                        fontFamily: 'MyriadPro',
                        fontSize: screenWidth / 18,
                        //fontSize: 20,
                        color: const Color(0xff000000),
                      ),
                    ),
                    const Text(
                      "\n",
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        Text(AppStrings.upgradePro + AppStrings.yoursession1,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              shadows: [
                                Shadow(color: Colors.white70, blurRadius: 20)
                              ],
                              fontFamily: 'MyriadPro',
                              fontSize: screenWidth / 18,
                              // fontSize: 20,
                              color: const Color(0xff000000),
                            )),
                        Container(
                            margin:
                                EdgeInsets.fromLTRB(0, screenWidth / 21, 0, 0),
                            padding: EdgeInsets.zero,
                            width: screenWidth / 2,
                            // width: 320,
                            height: 7,
                            child: Image(
                              image: AssetImage(ImageUtils.selectbar),
                              fit: BoxFit.fitWidth,
                            )),
                      ],
                    ),
                    const Text(
                      "\n                     ",
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Text(AppStrings.upgradehere,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              shadows: [
                                Shadow(color: Colors.white70, blurRadius: 20)
                              ],
                              fontFamily: 'MyriadPro',
                              fontSize: screenWidth / 18,
                              //fontSize: 20,
                              color: const Color(0xff000000),
                            )),
                        Container(
                            padding: EdgeInsets.zero,
                            width: screenWidth / 9,
                            // width: 55,
                            margin:
                                EdgeInsets.fromLTRB(0, screenWidth / 21, 0, 0),
                            child: Image(
                              image: AssetImage(ImageUtils.activeSmall),
                              fit: BoxFit.fitWidth,
                            )),
                        // Container(
                        //     // margin: EdgeInsets.fromLTRB(62, 15, 0, 0),
                        //     padding: EdgeInsets.zero,
                        //     width: 40,
                        //     child: Image(
                        //       image: AssetImage(ImageUtils.selectbar),
                        //       fit: BoxFit.fitWidth,
                        //     )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Components.homebutton(width: screenWidth, height: screenHeight)
          ],
        ),
      ),
    );
  }
}
