import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:ai4one/views/home.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai4one/utils/app_strings.dart';
import 'package:ai4one/utils/images_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widget/components.dart';

class HelpSection extends StatefulWidget {
  const HelpSection({super.key});

  @override
  State<HelpSection> createState() => HelpSectionState();
}

class HelpSectionState extends State<HelpSection> {
  //final controller = Get.put(OnboardController());
  final assetsAudioPlayer = AssetsAudioPlayer();
  final Uri _url = Uri.parse('https://ai4one.com/app');

  String bg1 = ImageUtils.bghelp;
  String centerCont = ImageUtils.centerCont;
  String progbar = ImageUtils.progbar;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () {
        assetsAudioPlayer.dispose();
        Get.to(Home());
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
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: screenWidth / 1.4,
                    // width: 265,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 50, 0),
                          child: Transform(
                            transform: Matrix4.identity()
                              ..scale(1.0,
                                  1.8), // Adjust the vertical scale (2.0 for double height)
                            alignment: Alignment.center,
                            child: Text(
                              AppStrings.helpSection + "      ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                shadows: [
                                  Shadow(color: Colors.white70, blurRadius: 20)
                                ],
                                fontFamily: 'MyriadPro',
                                fontSize: screenWidth / 10.5,
                                //fontSize: 29,
                                color: const Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Components.helpRow(
                            width: screenWidth,
                            height: screenHeight,
                            text: AppStrings.purpose,
                            onTap: () {
                              assetsAudioPlayer.open(
                                Playlist(audios: [
                                  Audio("assets/sounds/H1.mp3"),
                                ]),
                              );
                            }),
                        Components.helpRow(
                            width: screenWidth,
                            height: screenHeight,
                            text: AppStrings.whois,
                            onTap: () {
                              assetsAudioPlayer.open(
                                Audio("assets/sounds/H2.mp3"),
                              );
                            }),
                        Components.helpRow(
                            width: screenWidth,
                            height: screenHeight,
                            text: AppStrings.interactive,
                            onTap: () {
                              assetsAudioPlayer.open(
                                Audio("assets/sounds/H3.mp3"),
                              );
                            }),
                        Components.helpRow(
                            width: screenWidth,
                            height: screenHeight,
                            text: AppStrings.recommended,
                            onTap: () {
                              assetsAudioPlayer.open(
                                Audio("assets/sounds/H4.mp3"),
                              );
                            }),
                        Components.helpRow(
                            width: screenWidth,
                            height: screenHeight,
                            text: AppStrings.settings,
                            onTap: () {
                              assetsAudioPlayer.open(
                                Audio("assets/sounds/H5.mp3"),
                              );
                            }),
                        Components.helpRow(
                            width: screenWidth,
                            height: screenHeight,
                            text: AppStrings.monitored,
                            onTap: () {
                              assetsAudioPlayer.open(
                                Audio("assets/sounds/H6.mp3"),
                              );
                            }),
                        Components.helpRow(
                            width: screenWidth,
                            height: screenHeight,
                            text: AppStrings.appwork,
                            onTap: () {
                              assetsAudioPlayer.open(
                                Audio("assets/sounds/H7.mp3"),
                              );
                            }),
                        Components.helpRow(
                            width: screenWidth,
                            height: screenHeight,
                            text: AppStrings.privacy,
                            onTap: () {
                              assetsAudioPlayer.open(
                                Audio("assets/sounds/H8.mp3"),
                              );
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: _launchUrl,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
                                child: Stack(
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 12, 0, 0),
                                        padding: EdgeInsets.zero,
                                        width: 75,
                                        height: 19,
                                        child: Image(
                                          image: AssetImage(
                                              ImageUtils.activeSmall),
                                          fit: BoxFit.fitWidth,
                                        )),
                                    Text(
                                      AppStrings.webpage,
                                      style: TextStyle(
                                        shadows: [
                                          Shadow(
                                              color: Colors.white70,
                                              blurRadius: 5)
                                        ],
                                        fontFamily: 'MyriadPro',
                                        fontSize: screenWidth / 20.5,
                                        // fontSize: 20,
                                        color: const Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Components.homebutton(width: screenWidth, height: screenHeight)
            ],
          ),
        ),
      ),
    );
  }
}
