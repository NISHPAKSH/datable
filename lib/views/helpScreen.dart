import 'dart:io';
import 'dart:typed_data';

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

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => HelpScreenState();
}

class HelpScreenState extends State<HelpScreen> {
  final Uri _url = Uri.parse('https://www.woolha.com');
  AudioPlayer audioPlayer = AudioPlayer();
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url,
        mode: LaunchMode.externalNonBrowserApplication)) {
      throw Exception('Could not launch $_url');
    }
  }

  List<String> assetAudioFiles = [
    'assets/audio/S1B_1.mp3', // Replace with the URLs or local paths of your audio files
    'assets/audio/L2_32.mp3',
    'assets/audio/S1B_2.mp3',
    'assets/audio/L1s16.mp3',
  ];
  //S1B_1+ L2_32 +S1B_2+L1S16
  String tempFile = 'output45.mp3';
  Future<List<String>> copyAssetFilesToStorage() async {
    List<String> localFilePaths = [];

    for (String assetFile in assetAudioFiles) {
      String localFilePath = await copyAssetToFile(assetFile);
      localFilePaths.add(localFilePath);
    }

    return localFilePaths;
  }

  Future<String> copyAssetToFile(String assetFilePath) async {
    final ByteData data = await rootBundle.load(assetFilePath);
    final Directory tempDir = await getTemporaryDirectory();
    final File tempFile =
        File('${tempDir.path}/${assetFilePath.split('/').last}');
    await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
    return tempFile.path;
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

    // AudioPlayer player = AudioPlayer();

    // for (String filePath in assetAudioFiles) {
    //   //await player.setUrl(filePath);
    //   print('filePath $filePath');
    //   await player.play(AssetSource(filePath));

    //   // Wait for the audio to finish playing before playing the next one
    //   //await player.playerStateStream
    //   //  .firstWhere((state) => state == PlayerState.completed);
    // }

    // // Release the resources used by the player
    // await player.dispose();

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

    // FFmpegKit.execute(cmd5).then((session) async {
    //   print('session $session');
    //   final returnCode = await session.getReturnCode();
    //   print('returnCode $returnCode');

    //   if (ReturnCode.isSuccess(returnCode)) {
    //     print('Audio files merged successfully $returnCode');
    //     // SUCCESS
    //   } else if (ReturnCode.isCancel(returnCode)) {
    //     print('isCancel $returnCode');
    //     // CANCEL
    //   } else {
    //     print('Error merging audio files: $returnCode');
    //     var rr = await File(combinedAudioPath).exists();
    //     print('rr $rr');
    //     AudioPlayer audioPlayer = AudioPlayer();
    //     audioPlayer.play(DeviceFileSource(audioFiles[0]));

    //     // audioPlayer.play(DeviceFileSource(outputFilePath));
    //   }
    // });

    // Execute the FFmpeg command
    // int result = await flutterFFmpeg.execute(command);

    // if (result == 0) {
    //   // Successfully combined the audio files
    //   print('Audio files combined: $combinedAudioPath');
    // } else {
    //   // Error occurred during audio merging
    //   print('Error combining audio files');
    // }
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

  void combineAndPlayAudio() async {
    List<String> localFilePaths = await copyAssetFilesToStorage();
    await combineAudio(localFilePaths); //localFilePaths

    // Now you can play the combined audio using audio player or other methods.
  }

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
                "Help Section",
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
              textSection(context, 'Purpose of this app', 'H1', audioPlayer),
              textSection(context, 'Who is Uno?', 'H2', audioPlayer),
              textSection(context, 'Interactive Mode', 'H3', audioPlayer),
              textSection(context, 'Recommended time use', 'H4', audioPlayer),
              textSection(context, 'Settings', 'H5', audioPlayer),
              textSection(context, 'Monitored progress', 'H6', audioPlayer),
              textSection(context, 'How does the app work', 'H7', audioPlayer),
              textSection(context, 'Privacy', 'H8', audioPlayer),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              InkWell(
                onTap: () => {_launchUrl()},
                child: Text(
                  AppStrings.webpage,
                  style: const TextStyle(
                    shadows: [Shadow(color: Colors.white70, blurRadius: 20)],
                    //fontFamily: 'MyriadPro-Regular',
                    fontSize: 20,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              InkWell(
                onTap: () => Get.back(),
                //onTap: () => {()},
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

Widget textSection(BuildContext context, String title, String helpAudio,
    AudioPlayer audioPlayer) {
  return SizedBox(
    height: 56,
    width: MediaQuery.of(context).size.width * .72,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () =>
                  {audioPlayer.play(AssetSource('audio/$helpAudio.mp3'))},
              child: Image(
                //width: 55,
                height: 55,
                fit: BoxFit.fitWidth,
                image: AssetImage(ImageUtils.audio),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  color: ColorUtils.black,
                  fontWeight: FontWeight.w400),
            ),
          ],
        )
      ],
    ),
  );
}
