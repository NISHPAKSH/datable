import 'package:ai4one/widget/components.dart';
import 'package:flutter/material.dart';
import 'package:ai4one/utils/app_strings.dart';
import 'package:ai4one/utils/images_utils.dart';

class PriorityFeedback extends StatefulWidget {
  const PriorityFeedback({super.key});

  @override
  State<PriorityFeedback> createState() => PriorityFeedbackState();
}

class PriorityFeedbackState extends State<PriorityFeedback>
    with TickerProviderStateMixin {
  //final controller = Get.put(OnboardController());

  int _stringIndex = 0;
  String bg1 = ImageUtils.skybg;
  String bgbrown = ImageUtils.bgbrown;
  String centerCont = ImageUtils.centerCont;
  String startbutton = ImageUtils.startbutton;

  late Animation<int> _characterCount;

  static List<String> _kStrings = <String>[
    AppStrings.topCommitments,
    AppStrings.topCommitments,
    AppStrings.yourtop,
    AppStrings.actively,
    AppStrings.upbringing,
    AppStrings.healthy,
    AppStrings.greatly,
    AppStrings.self,
  ];
  String get _currentString => _kStrings[_stringIndex % _kStrings.length];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
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
              child: GestureDetector(
                onTap: () async {
                  AnimationController controller = new AnimationController(
                    duration: const Duration(milliseconds: 4000),
                    vsync: this,
                  );
                  setState(() {
                    _stringIndex = _stringIndex == null ? 0 : _stringIndex + 1;
                    _characterCount =
                        new StepTween(begin: 0, end: _currentString.length)
                            .animate(new CurvedAnimation(
                                parent: controller, curve: Curves.easeIn));
                  });
                  await controller.forward();
                  controller.dispose();
                },
                child: _stringIndex == 0
                    ? Components.feedbackContent(
                        width: screenWidth,
                        height: screenHeight,
                        toptext: AppStrings.topCommitments,
                        middletext: AppStrings.yourtop,
                        text1: AppStrings.actively,
                        text2: AppStrings.upbringing,
                        text3: AppStrings.healthy,
                        text4: AppStrings.greatly,
                        text5: AppStrings.self,
                      )
                    : new AnimatedBuilder(
                        animation: _characterCount,
                        builder: (BuildContext context, Widget? child) {
                          String text = _currentString.substring(
                              0, _characterCount.value);

                          return Components.feedbackContent(
                            width: screenWidth,
                            height: screenHeight,
                            toptext: text,
                            middletext: AppStrings.yourtop,
                            text1: AppStrings.actively,
                            text2: AppStrings.upbringing,
                            text3: AppStrings.healthy,
                            text4: AppStrings.greatly,
                            text5: AppStrings.self,
                          );
                        },
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
