import 'package:ai4one/utils/color_utils.dart';
import 'package:ai4one/views/home.dart';
import 'package:ai4one/widget/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai4one/utils/app_strings.dart';
import 'package:ai4one/utils/images_utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProgressBoard extends StatefulWidget {
  const ProgressBoard({super.key});

  @override
  State<ProgressBoard> createState() => ProgressBoardState();
}

class ProgressBoardState extends State<ProgressBoard> {
  String bg1 = ImageUtils.bgenergy;
  String centerCont = ImageUtils.centerCont;
  String progbar = ImageUtils.progbar;
  TextEditingController tscore = TextEditingController();
  TextEditingController ascore = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<ScoreDate> data = [
      ScoreDate('1', 12),
      ScoreDate('2', 9),
      ScoreDate('3', 21),
      ScoreDate('4', 50),
      ScoreDate('5', 10),
      ScoreDate('6', 9),
      ScoreDate('7', 7),
      ScoreDate('8', 4),
      ScoreDate('9', 9),
      ScoreDate('10', 10)
    ];
    return WillPopScope(
      onWillPop: () {
        Get.to(const Home());
        return Future(() => true);
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(

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
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Expanded(
                   child: Container(
                     child: Column(
                       children: [
                         SizedBox(
                          height: 40,
                ),
                         SizedBox(
                           width: screenWidth/1.2,
                           child: Column(
                             // mainAxisAlignment: MainAxisAlignment.start,
                             // crossAxisAlignment: CrossAxisAlignment.end,
                             children: [
                               Container(
                                 margin: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                                 child: Text(
                                   AppStrings.progress,
                                   textAlign: TextAlign.center,
                                   style: const TextStyle(
                                     shadows: [
                                       Shadow(color: Colors.white70, blurRadius: 20)
                                     ],
                                     fontFamily: 'MyriadPro-Regular',
                                     fontSize: 34,
                                     color: Color(0xff000000),
                                   ),
                                 ),
                               ),
                               const SizedBox(
                                 height: 30,
                               ),
                               Container(
                                 margin: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.end,
                                   children: [
                                     Text(
                                       AppStrings.tscore,
                                       style: const TextStyle(
                                         shadows: [
                                           Shadow(color: Colors.white70, blurRadius: 20)
                                         ],
                                         fontFamily: 'MyriadPro-Regular',
                                         fontSize: 20,
                                         color: Color(0xff000000),
                                       ),
                                     ),
                                     const SizedBox(
                                       width: 10,
                                     ),
                                     Container(
                                       color: ColorUtils.white,
                                       width: 50,
                                       height: 20,
                                       child: const Text(
                                         " ",
                                         style: TextStyle(
                                           shadows: [
                                             Shadow(
                                                 color: Colors.white70, blurRadius: 20)
                                           ],
                                           fontFamily: 'MyriadPro-Regular',
                                           fontSize: 20,
                                           color: Color(0xff000000),
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                               const SizedBox(
                                 height: 5,
                               ),
                               Container(
                                 margin: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.end,
                                   children: [
                                     Text(
                                       AppStrings.ascore,
                                       style: const TextStyle(
                                         shadows: [
                                           Shadow(color: Colors.white70, blurRadius: 20)
                                         ],
                                         fontFamily: 'MyriadPro-Regular',
                                         fontSize: 18,
                                         color: Color(0xff000000),
                                       ),
                                     ),
                                     const SizedBox(
                                       width: 5,
                                     ),
                                     Container(
                                       color: ColorUtils.white,
                                       width: 50,
                                       height: 20,
                                       child: const Text(
                                         " ",
                                         style: TextStyle(
                                           shadows: [
                                             Shadow(
                                                 color: Colors.white70, blurRadius: 20)
                                           ],
                                           fontFamily: 'MyriadPro-Regular',
                                           fontSize: 18,
                                           color: Color(0xff000000),
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                               SizedBox(
                                 height: 100,
                               ),
                               Container(
                                 height: MediaQuery.of(context).size.height * 0.4,
                                 // width: 380,
                                 width: screenWidth,

                                 margin: const EdgeInsets.fromLTRB(10, 0, 15, 0),
                                 child: SfCartesianChart(
                                     plotAreaBorderColor: Colors.transparent,
                                     primaryXAxis: CategoryAxis(
                                       majorGridLines: const MajorGridLines(width: 0),
                                     ),
                                     primaryYAxis: CategoryAxis(
                                       majorGridLines: const MajorGridLines(width: 0),
                                       maximum: 50

                                     ),
                                     axes: [CategoryAxis(

                                       majorGridLines: const MajorGridLines(width: 0),

                                     ),],
                                     borderColor: Colors.transparent,
                                     // Chart title
                                     title: ChartTitle(text: ''),
                                     // Enable legend
                                     legend: const Legend(isVisible: false),
                                     // Enable tooltip
                                     tooltipBehavior: TooltipBehavior(enable: true),
                                     series: <ChartSeries<ScoreDate, String>>[
                                       LineSeries<ScoreDate, String>(
                                           color: ColorUtils.red,
                                           dataSource: data,
                                           xValueMapper: (ScoreDate score, _) =>
                                           score.day,
                                           yValueMapper: (ScoreDate score, _) =>
                                           score.score,
                                           name: 'Score',
                                           // Enable data label
                                           markerSettings: MarkerSettings(
                                               isVisible: true,
                                               shape: DataMarkerType.circle,
                                               borderColor: Colors.red,
                                               color: Colors.red
                                           ),
                                           dataLabelSettings:
                                           DataLabelSettings(isVisible: true)
                                       )
                                     ]),
                               )
                             ],
                           ),
                         ),

                       ],
                     ),
                   ),
                 ),
               
             Components.homebutton(width: screenWidth,height: screenHeight),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScoreDate {
  ScoreDate(this.day, this.score);
  final String day;
  final double score;
}
