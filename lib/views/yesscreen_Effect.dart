import 'package:flutter/material.dart';
import 'package:ai4one/utils/images_utils.dart';
import 'package:ai4one/views/screenCont.dart';

class YesScreenEffect extends StatefulWidget {
  const YesScreenEffect({super.key});

  @override
  State<YesScreenEffect> createState() => YesScreenEffectState();
}

class YesScreenEffectState extends State<YesScreenEffect> {
  @override
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

  String greeEffect = ImageUtils.greeEffect;

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
            image: AssetImage(greeEffect),
            fit: BoxFit.cover,
          ),
        ),
        child: const Column(
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
