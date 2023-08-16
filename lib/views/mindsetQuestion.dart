import 'package:adobe_xd/pinned.dart';
import 'package:ai4one/model/mindset.dart';
import 'package:ai4one/views/home.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:ai4one/utils/app_strings.dart';
import 'package:ai4one/utils/images_utils.dart';
import 'package:ai4one/views/mindsetFeedback.dart';

import '../database/dbhelper.dart';
import '../widget/components.dart';

class MindsetQuestion extends StatefulWidget {
  const MindsetQuestion({super.key});

  @override
  State<MindsetQuestion> createState() => MindsetQuestionState();
}

class MindsetQuestionState extends State<MindsetQuestion> {
  final dbhelper = DBHelper();
  List<Mindsets> mindset = <Mindsets>[];
  void setupList() async {
    mindset = await dbhelper.getMindsets();
  }
  //final controller = Get.put(OnboardController());
  FlipCardController controller = new FlipCardController();
  String bgenergy = ImageUtils.bgenergym;
  String audio = ImageUtils.audio;
  String importnot = ImageUtils.importnot;
  String mindsetQuestion = ImageUtils.curiosity;
  double start = 300.0;
  double end = 200.0;
  double _value = 45;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgenergy),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Components.quesContent(
                width: screenWidth,
                controller: controller,
                text: AppStrings.curiosity,
                card: mindsetQuestion,
                height: screenHeight),
            Components.slider(
              widthEnd: screenWidth/1.3,
                value: _value,
                width: screenWidth,
                height: screenHeight,
                toptext: AppStrings.often,
                endtext: AppStrings.rarely,
                onChanged: (dynamic value) {
                  setState(() {
                    _value = value;
                  });
                },
                onChangeEnd: (a) {
                  controller.toggleCard();
                  Future.delayed(Duration(milliseconds: 500), () {
                    Get.to(MindsetFeedback());
                  });
                },
                bground: importnot),
          ],
        ),
      ),
    );
  }
}

class _SfTrackShape extends SfTrackShape {
  @override
  void paint(PaintingContext context, Offset offset, Offset? thumbCenter,
      Offset? startThumbCenter, Offset? endThumbCenter,
      {required RenderBox parentBox,
      required themeData,
      SfRangeValues? currentValues,
      dynamic currentValue,
      required Animation<double> enableAnimation,
      required Paint? inactivePaint,
      required Paint? activePaint,
      required TextDirection textDirection}) {
    Paint paint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7;
    super.paint(context, offset, thumbCenter, startThumbCenter, endThumbCenter,
        parentBox: parentBox,
        themeData: themeData,
        enableAnimation: enableAnimation,
        inactivePaint: inactivePaint,
        activePaint: paint,
        textDirection: textDirection);
  }
}
