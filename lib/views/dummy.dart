import 'dart:io';
import 'dart:math';

import 'package:ai4one/utils/app_strings.dart';
import 'package:ai4one/utils/color_utils.dart';
import 'package:ai4one/views/home.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter/material.dart';
import 'package:ai4one/utils/images_utils.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:path_provider/path_provider.dart';

class DummyScreen extends StatefulWidget {
  const DummyScreen({super.key});

  @override
  State<DummyScreen> createState() => DummyScreenState();
}

class DummyScreenState extends State<DummyScreen> {
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void dispose() {
    super.dispose();
    audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageUtils.helpBG),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              Text(
                "Audio Test",
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 1,
                    shadows: const [
                      Shadow(color: Color(0xFFF9F8FC), blurRadius: 50)
                    ],
                    color: ColorUtils.black,
                    fontSize: 44,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .06,
              ),
              textSection(
                  context, 'S1B_1', 'L2_32', 'S1B_2', 'L1s16', audioPlayer),
              textSection(context, 'S2B_1', 'L1s16', 'S2B_2', 'L2_30',
                  audioPlayer), //S2B_1+ L1S16+S2b_2+ L2_30
              textSection(context, 'S1C_1', 'L2_32', 'S1C_2', 'L1s16',
                  audioPlayer), //S1C_1+ L2_32+S1C_2+ L1S16
              textSection(context, 'S2C_1', 'L1s04', 'SC2_2', 'L2_37',
                  audioPlayer), //S2C_1+L1S+SC2_2+L2O
              textSection(context, 'S1C_1', 'L2_28', 'S1C_2', 'L1s11',
                  audioPlayer), //S1C_1+ L2_28+S1C_2+ L1S
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     InkWell(
              //         onTap: () {
              //           audioPlayer.play(AssetSource('audio/S1B_1.mp3'));
              //         },
              //         child: Text('Audio 1')),
              //     InkWell(
              //         onTap: () {
              //           audioPlayer.play(AssetSource('audio/L2_32.mp3'));
              //         },
              //         child: Text('Audio 2')),
              //     InkWell(
              //         onTap: () {
              //           audioPlayer.play(AssetSource('audio/S1B_2.mp3'));
              //         },
              //         child: Text('Audio 3')),
              //     InkWell(
              //         onTap: () {
              //           audioPlayer.play(AssetSource('audio/L1s16.mp3'));
              //         },
              //         child: Text('Audio 4'))
              //   ],
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              InkWell(
                onTap: () => Get.back(),
                //onTap: () => {combineAndPlayAudio()},
                child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    width: 100,
                    child: Image(
                      image: AssetImage(ImageUtils.logo),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget textSection(BuildContext context, String title1, String title2,
    String title3, String title4, AudioPlayer audioPlayer) {
  String generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(
        List.generate(len, (index) => r.nextInt(33) + 89));
  }

  List<String> assetAudioFiles = [
    'assets/audio/$title1.mp3', // Replace with the URLs or local paths of your audio files
    'assets/audio/$title2.mp3', // Re
    'assets/audio/$title3.mp3', // Re
    'assets/audio/$title4.mp3' // Re
  ];
  //S1B_1+ L2_32 +S1B_2+L1S16
  String tempFile = '${generateRandomString(6)}.mp3';

  Future<String> copyAssetToFile(String assetFilePath) async {
    final ByteData data = await rootBundle.load(assetFilePath);
    final Directory tempDir = await getTemporaryDirectory();
    final File tempFile =
        File('${tempDir.path}/${assetFilePath.split('/').last}');
    await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
    return tempFile.path;
  }

  Future<void> checkIfFileExistsInTemporaryDirectory(fileName) async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      String filePath =
          "${tempDir.path}/$fileName"; // Replace with your file name and extension

      File file = File(filePath);
      bool fileExists = await file.exists();

      if (fileExists) {
        print("File exists in TemporaryDirectory: $filePath");
      } else {
        print("File does not exist in TemporaryDirectory: $filePath");
      }
    } catch (e) {
      print("Error while checking file existence: $e");
    }
  }

  Future<List<String>> copyAssetFilesToStorage() async {
    List<String> localFilePaths = [];

    for (String assetFile in assetAudioFiles) {
      String localFilePath = await copyAssetToFile(assetFile);
      localFilePaths.add(localFilePath);
    }

    return localFilePaths;
  }

  Future<void> combineAudio(List<String> audioFiles) async {
    debugPrint('audioFiles $audioFiles');
    //FlutterFFmpeg flutterFFmpeg = FlutterFFmpeg();
    /**
     *   final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/media';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/$nameOfVideo';
     */

    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    // Create a temporary output file path
    String combinedAudioPath = '$tempPath/$tempFile';
    debugPrint('combinedAudioPath $combinedAudioPath');

    // Prepare the FFmpeg command to concatenate audio files
    String inputFiles = audioFiles.join('|');
    debugPrint('inputFiles $inputFiles');

    String command = '-i "concat:$inputFiles" -acodec copy $combinedAudioPath';

    debugPrint('command $command');

    var cmd2 =
        "-i ${audioFiles[0]} -i ${audioFiles[1]} -i ${audioFiles[2]} -filter_complex [0:0][1:0][2:0]concat=n=3:v=0:a=1[out] -map [out] $combinedAudioPath";

    debugPrint('cmd2 $cmd2');

    var cmd3 =
        "-i ${audioFiles[0]} -i ${audioFiles[1]} -i ${audioFiles[2]} -filter_complex [0:0][1:0][2:0]concat=n=3:v=0:a=1[out] -map [out] $combinedAudioPath";

    debugPrint('cmd3 $cmd3');

    var cmd4 =
        "-i ${audioFiles[0]} -i ${audioFiles[1]} -i ${audioFiles[2]} -filter complex amerge $combinedAudioPath";
    debugPrint('cmd4 $cmd4');

    var cmd5 =
        "-i “concat:${audioFiles[0]}|${audioFiles[1]}|${audioFiles[2]}“ -acodec copy $combinedAudioPath";

    debugPrint('cmd5 $cmd5');

    var cmd6 =
        "-ss 3 -i ${audioFiles[0]}  -c copy $combinedAudioPath"; // cut the Audio length

    //File(file.path)

    try {
      FFmpegKit.execute(command) //minusLength
          .then((rt) async {
        print('[TRIMMED AUDIO RESULT] : ${await rt.getReturnCode()}');

        var rr = await File(combinedAudioPath).exists();
        print('rr $rr');

        checkIfFileExistsInTemporaryDirectory(tempFile);

        audioPlayer.play(DeviceFileSource(combinedAudioPath));

        if (rt == -1) {
          throw Exception(("Something went wrong when trimming the video"));
        }
      });
    } catch (e) {
      print("_flutterFFmpeg error is : $e");
    }
  }

  void combineAndPlayAudio() async {
    List<String> localFilePaths = await copyAssetFilesToStorage();
    await combineAudio(localFilePaths); //localFilePaths

    // Now you can play the combined audio using audio player or other methods.
  }

  return SizedBox(
    height: 56,
    //width: MediaQuery.of(context).size.width * .72,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => {combineAndPlayAudio()},
              child: Image(
                //width: 55,
                height: 55,
                fit: BoxFit.fitWidth,
                image: AssetImage(ImageUtils.audio),
              ),
            ),
            InkWell(
                onTap: () {
                  audioPlayer.play(AssetSource('audio/$title1.mp3'));
                },
                child: Text(title1,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16))),
            InkWell(
                onTap: () {
                  audioPlayer.play(AssetSource('audio/$title2.mp3'));
                },
                child: Text(title2,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16))),
            InkWell(
                onTap: () {
                  audioPlayer.play(AssetSource('audio/$title3.mp3'));
                },
                child: Text(title3,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16))),
            InkWell(
                onTap: () {
                  audioPlayer.play(AssetSource('audio/$title4.mp3'));
                },
                child: Text(title4,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16))),
          ],
        )
      ],
    ),
  );
}
