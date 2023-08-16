import 'package:adobe_xd/page_link.dart';
import 'package:ai4one/views/home.dart';
import 'package:ai4one/views/unoStartScreen.dart';
import 'package:ai4one/widget/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai4one/utils/images_utils.dart';
import 'package:ai4one/views/screenCont.dart';

class ScreenYesno extends StatefulWidget {
  @override
  State<ScreenYesno> createState() => ScreenYesnoState();
}

class ScreenYesnoState extends State<ScreenYesno> {
  //final controller = Get.put(OnboardController());

  String bg1 = ImageUtils.coreBackgound3;
  String bgR = ImageUtils.coreBackgoundRN;
  String bgG = ImageUtils.coreBackgound2;
  String yes = ImageUtils.yes;
  String yesclick = ImageUtils.yesButtonclick;
  String yescli = ImageUtils.yescli;
  String no = ImageUtils.no;
  String noclick = ImageUtils.noButtonclick;
  String nocli = ImageUtils.nocli;
  String greeEffect = ImageUtils.greeEffect;
  String geffects = ImageUtils.geffects;
  String reffect = ImageUtils.reffect;
  String redEffect = ImageUtils.redEffect;
  String center = ImageUtils.center;
  bool effectgreen = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      effectgreen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
print(screenWidth);
print(screenHeight);
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
            effectgreen == false
                ? Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    width: screenWidth/1.07,
                    child: Image(
                      image: AssetImage(center),
                    ))
                :
            Container(margin: const EdgeInsets.fromLTRB(0, 0, 0, 2), width: screenWidth/1.07,height: screenHeight/2.2,),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => {
                    setState(() {
                      yes = yesclick;
                    }),
                    Future.delayed(Duration(milliseconds: 200), () {
                      setState(() {
                        bg1 = geffects;
                        effectgreen = true;
                      });
                    }),
                  Future.delayed(const Duration(milliseconds: 900), () {

                        Components.fadetopage(
                                () => ScreenCont(),context );

                  })
                  },
                  child: effectgreen == false
                      ? Container(
                           width: screenWidth/2.49,
                          //width: 150,
                          child: Image(
                            image: AssetImage(yes),
                          ))
                      : Container(
                     // width: 150,
                      width: screenWidth/2.49,
                      child: Image(
                        image: AssetImage(yescli),
                      )),
                ),

    effectgreen == false
        ? InkWell(

              onTap:   (){
                Future.delayed(const Duration(milliseconds: 0), () {

                  setState(() {
                    no = noclick;
             });
            });
    Future.delayed(const Duration(milliseconds: 200), () {
             setState(() {
               bg1 = reffect;
               effectgreen = true;
             });
    });
    Future.delayed(const Duration(milliseconds: 900), () {


                  Components.fadetopage(() => ScreenCont(),context,);
    });
    },
          child: SizedBox(
          width: screenWidth/2.49,
          //width: 150,
              child: Image(
                image: AssetImage(no),
              )),
        )
        :SizedBox(
      //  width: 150,
        width: screenWidth/2.49,
        child: Image(
          image: AssetImage(nocli),
        )),
              ],
            ),
            const Expanded(child: SizedBox()),
            // Components.homebutton(width:screenWidth,height: screenHeight)

                 Components.homebutton(width: screenWidth,height: screenHeight)

          ],
        ),
      ),
    );
  }
}
