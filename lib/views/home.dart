import 'package:ai4one/utils/color_utils.dart';
import 'package:ai4one/views/dummy.dart';
import 'package:ai4one/views/helpScreen.dart';
import 'package:ai4one/views/priorityStart.dart';
import 'package:ai4one/views/mindsetStart.dart';
import 'package:ai4one/views/progressBoard.dart';
import 'package:ai4one/views/tacticsStart.dart';
import 'package:ai4one/views/upgradeProVersion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai4one/utils/images_utils.dart';
import 'package:ai4one/views/unoStartScreen.dart';
import 'package:ai4one/widget/components.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  bool click0 = false;
  bool click = false;
  bool click1 = false;
  bool click2 = false;
  bool click3 = false;
  bool click4 = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.transparent,child: Text('Test Audio',style: TextStyle(fontSize: 16,color: ColorUtils.white),),onPressed: ()=>{
         Get.to(const DummyScreen())
      }),
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageUtils.background),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           
            SizedBox(
              height: MediaQuery.of(context).size.height * .20,
            ),
            Components.UderlineClick(
                onTap: () => {
                      setState(() {
                        click0 = true;
                      }),
                      Future.delayed(const Duration(milliseconds: 50), () {
                        Get.to(const UnoStartScreen());
                      }),
                    },
                onHover: (a) => setState(() {
                      click0 = a;
                    }),
                text: ImageUtils.intrac,
                click0: click0,
                width: 280,
                height: 250),
            InkWell(
              onTap: () => setState(() {
                click = true;
                Get.to(PriorityStart());
              }),
              onHover: (a) => setState(() {
                click = a;
              }),
              child: Stack(
                clipBehavior: Clip.hardEdge,
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                      width: 200,
                      child: Image(
                        image: AssetImage(ImageUtils.yourPriorities),
                      )),
                  click == false
                      ? Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          width: 300,
                          child: Image(
                            image: AssetImage(ImageUtils.unselect1),
                          ))
                      : Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          padding: EdgeInsets.zero,
                          width: 250,
                          height: 7,
                          child: Image(
                            image: AssetImage(ImageUtils.selectbar),
                            fit: BoxFit.fitWidth,
                          )),
                ],
              ),
            ),
            InkWell(
              onTap: () => setState(() {
                click1 = true;
                Get.to(const TacticsStart());
              }),
              onHover: (a) => setState(() {
                click1 = a;
              }),
              child: Stack(
                clipBehavior: Clip.hardEdge,
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                      width: 210,
                      child: Image(
                        image: AssetImage(ImageUtils.yourPriorities2),
                      )),
                  click1 == false
                      ? Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          width: 250,
                          child: Image(
                            image: AssetImage(ImageUtils.unselect1),
                          ))
                      : Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          padding: EdgeInsets.zero,
                          width: 250,
                          height: 7,
                          child: Image(
                            image: AssetImage(ImageUtils.selectbar),
                            fit: BoxFit.fitWidth,
                          )),
                ],
              ),
            ),
            InkWell(
              onTap: () => setState(() {
                click2 = true;
                Get.to(const MindsetStart());
              }),
              onHover: (a) => setState(() {
                click2 = a;
              }),
              child: Stack(
                clipBehavior: Clip.hardEdge,
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                      width: 230,
                      child: Image(
                        image: AssetImage(ImageUtils.mindsetDirections),
                      )),
                  click2 == false
                      ? Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          width: 250,
                          child: Image(
                            image: AssetImage(ImageUtils.unselect1),
                          ))
                      : Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          padding: EdgeInsets.zero,
                          width: 250,
                          height: 7,
                          child: Image(
                            image: AssetImage(ImageUtils.selectbar),
                            fit: BoxFit.fitWidth,
                          )),
                ],
              ),
            ),
            InkWell(
              onTap: () => setState(() {
                click3 = true;
                Get.to(const ProgressBoard());
              }),
              onHover: (a) => setState(() {
                click3 = a;
              }),
              child: Stack(
                clipBehavior: Clip.hardEdge,
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                      width: 210,
                      child: Image(
                        image: AssetImage(ImageUtils.progres),
                      )),
                  click3 == false
                      ? Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          width: 250,
                          child: Image(
                            image: AssetImage(ImageUtils.unselect1),
                          ))
                      : Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          padding: EdgeInsets.zero,
                          width: 250,
                          height: 7,
                          child: Image(
                            image: AssetImage(ImageUtils.selectbar),
                            fit: BoxFit.fitWidth,
                          )),
                ],
              ),
            ),
            InkWell(
              onTap: () => setState(() {
                //click4 = true;
                Get.to(const HelpScreen());
              }),
              onHover: (a) => setState(() {
                click4 = a;
              }),
              child: Stack(
                clipBehavior: Clip.hardEdge,
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                      width: 60,
                      child: Image(
                        image: AssetImage(ImageUtils.help),
                      )),
                  click4 == false
                      ? Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          width: 250,
                          child: Image(
                            image: AssetImage(ImageUtils.unselect1),
                          ))
                      : Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          padding: EdgeInsets.zero,
                          width: 250,
                          height: 7,
                          child: Image(
                            image: AssetImage(ImageUtils.selectbar),
                            fit: BoxFit.fitWidth,
                          )),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(const UpgradeProVersion());
              },
              child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: 100,
                  child: Image(
                    image: AssetImage(ImageUtils.logo),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
