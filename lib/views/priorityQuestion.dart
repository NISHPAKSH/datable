import 'package:ai4one/model/aspects.dart';
import 'package:ai4one/widget/components.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:ai4one/utils/app_strings.dart';
import 'package:ai4one/utils/images_utils.dart';
import 'package:ai4one/views/priorityFeedback.dart';

import '../database/dbhelper.dart';

class PriorityQuestion extends StatefulWidget {
  const PriorityQuestion({super.key});

  @override
  State<PriorityQuestion> createState() => PriorityQuestionState();
}

class PriorityQuestionState extends State<PriorityQuestion> {
  final dbhelper = DBHelper();
  List<Aspects> aspect = <Aspects>[];
  void setupList() async {
     aspect = await dbhelper.getAspects();
  }
  FlipCardController controller =new FlipCardController();
  String bgbrown = ImageUtils.bgbrown;
  String blackbg = ImageUtils.blackbg;
  String audio = ImageUtils.audio;
  String importnot = ImageUtils.importnot;
  String priorityQuestion = ImageUtils.energy;

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
            image: AssetImage(blackbg),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Components.quesContent(
                width:screenWidth,
                controller:controller,
                text: AppStrings.howenergy,
                card: priorityQuestion,
                height: screenHeight),
            Components.slider(
                widthEnd: screenWidth/1.45,
                value: _value,
                height: screenHeight,
                width: screenWidth,
                toptext: AppStrings.important,
                endtext: AppStrings.notImportant,
                onChanged: (dynamic value) {
                  setState(() {
                    _value = value;
                  });
                },
                onChangeEnd: (a) {
                  controller.toggleCard();
                  Future.delayed(Duration(milliseconds: 500), ()
                  {
                    Get.to(PriorityFeedback());
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
