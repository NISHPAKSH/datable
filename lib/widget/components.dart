// ignore_for_file: prefer_const_constructors

import 'package:adobe_xd/pinned.dart';
import 'package:ai4one/utils/color_utils.dart';
import 'package:ai4one/utils/font_utils.dart';
import 'package:ai4one/utils/images_utils.dart';
import 'package:ai4one/utils/size_utils.dart';
import 'package:ai4one/utils/style_utils.dart';
import 'package:ai4one/views/home.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Components {
  static Future fadetopage(Function nextpage,BuildContext context ,[double? duration, Curve? ease])
  {
    return
      Navigator.of(context).push(
      PageRouteBuilder(
      transitionDuration: Duration(
          milliseconds: ((duration ?? 1) * 1000).round()),
      pageBuilder: (context, animation, secondaryAnimation) => nextpage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(parent: animation, curve: ease ?? Curves.easeOut),
          ),
          child: child,
        );
      },
    )
      );
  }
  static Widget UderlineClick(
      {Function()? onTap,
      Function(bool a)? onHover,
      String? text,
      double? height,
      double? width,
      Color? color,
      bool? click0}) {
    return InkWell(
      onTap: onTap,
      onHover: onHover,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              width: width,
              child: Image(
                image: AssetImage(text!),
              )),
          click0 == false
              ? Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: height,
                  child: Image(
                    image: AssetImage(ImageUtils.unselect1),
                  ))
              : Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  padding: EdgeInsets.zero,
                  width: width,
                  height: 7,
                  child: Image(
                    image: AssetImage(ImageUtils.selectbar),
                    fit: BoxFit.fitWidth,
                  )),
        ],
      ),
    );
  }

  static Widget helpRow({
    Function()? onTap,
    String? text,
    double? height,
    double? width,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
              width: 40,

              child: Image(
                image: AssetImage(ImageUtils.audio),fit: BoxFit.fill,
              )),
        ),
        Text(
          text!,
          style: TextStyle(
            shadows: [Shadow(color: Colors.white70, blurRadius: 20)],
            fontFamily: 'MyriadPro',
            fontSize: width!/20.5,
           // fontSize: 20,
            color: const Color(0xff000000),
          ),
        ),
      ],
    );
  }

  static Widget startContent({
    Function()? onTap,
    String? text1,
    String? text2,
    String? text3,
    double? height,
    double? width,
  }) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
      child: Column(
        children: [
          Container(

            width: width!/1.5,


            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  decoration: TextDecoration.none,
                  shadows: [Shadow(color: Color(0xfffcf569), blurRadius: 15.0)],
                  fontFamily: 'MyriadPro',
                  fontSize: height!/40,
                  color: const Color(0xff000000),
                ),
                children: [
                  TextSpan(
                    text: text1,
                  ),
                  TextSpan(
                    text: '  \n\n',
                  ),
                  TextSpan(
                    text: text2,
                    style: TextStyle(
                      fontSize: height!/40,
                    ),
                  ),
                  TextSpan(
                    text: ' \n\n',
                  ),
                  TextSpan(
                    text: text3,
                  ),
                  TextSpan(
                    text: ' \n',
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                width: 250,
                child: Image(
                  image: AssetImage(ImageUtils.startbutton),
                )),
          ),
        ],
      ),
    );
  }

  static Widget homebutton({
    Function()? onTap,
    String? text1,
    String? text2,
    String? text3,
    double? height,
    double? width,
  }) {
    return GestureDetector(
      onTap: () => Get.to(Home()),
      child: Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
          width: width!/4,
          child: Image(
            image: AssetImage(ImageUtils.logo),
          )),
    );
  }

  static Widget quesContent({
    Function()? onTapcard,
    Function()? onTapaudio,
    String? text,
    String? card,
    double? height,
    double? width,
    required FlipCardController controller,
  }


  ) {

    return
      Container(
      margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageUtils.bgbrown),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 100, 0, 0),
                  child: Column(
                    children: [
                      Container(
                        width: width!/1.4,
                        height: height!/3.5,
                        child: Text(
                          text!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            shadows: [
                              Shadow(color: Colors.white70, blurRadius: 20)
                            ],
                            fontFamily: 'MyriadPro',
                            //fontSize:40,
                            fontSize: width!/10.8,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => onTapcard,
                        child: Container(
                          //width:199,
                            width:height!/4,
                            child:
                            FlipCard(
                              flipOnTouch: true,
                              controller:controller ,
                              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
                              direction: FlipDirection.HORIZONTAL, // default
                              side: CardSide.FRONT, // The side to initially display.
                              front: Container(
                                child:  Image(
                                  image: AssetImage(card!),
                                ),
                              ),
                              back: Container(
                                child:  Image(
                                  image: AssetImage(card!),
                                ),
                              ),
                            ),


                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: onTapaudio,
                  child: Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      width: 80,
                      child: Image(
                        image: AssetImage(ImageUtils.audio),
                      )),
                ),
                GestureDetector(
                  onTap: () => Get.to(Home()),
                  child: Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      width: width!/4,
                      child: Image(
                        image: AssetImage(ImageUtils.logo),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget slider({
    Function(dynamic a)? onChanged,
    Function(dynamic a)? onChangeEnd,
    String? toptext,
    String? endtext,
    required String? bground,
    required double value,
    required double? height,
    double? width,
    double? widthEnd,
  }) {
    return Stack(
      children: [
        Pinned.fromPins(
          Pin(size: 65, start: width!/1.2),
          Pin(size: height!+35, end: 200),
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
            width: 40,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bground!),
                fit: BoxFit.cover,
              ),
            ),
            child: SfSliderTheme(
              data: SfSliderThemeData(
                thumbColor: Colors.transparent,
                thumbRadius: 70,
                thumbStrokeWidth: 2,
                thumbStrokeColor: Colors.transparent,
              ),
              child: SfSlider.vertical(
                min: 0,
                max: 100,
                value: value,
                interval: 10,
                showTicks: false,
                showLabels: true,
                enableTooltip: false,
                // minorTicksPerInterval: 3,
                trackShape: _SfTrackShape(),
                thumbIcon: Image(
                  image: AssetImage(ImageUtils.divider),
                  width: 50,
                  height: 50,
                ),
                inactiveColor: Colors.transparent,
                onChanged: onChanged,
                onChangeEnd: onChangeEnd,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(spreadRadius: 1, blurRadius: 5, color: Color(0xFFFDE072))
          ]),
          margin: EdgeInsets.fromLTRB(width!/1.3, 30, 0, 0),
          child: Text(
            toptext!,
            style: TextStyle(
                fontSize: 20,
                shadows: [Shadow(blurRadius: 10, color: Colors.yellow)],
                color: Colors.black),
          ),
        ),
        Container(

          decoration: BoxDecoration(boxShadow: [
            BoxShadow(spreadRadius: 1, blurRadius: 5, color: Color(0xFF838FCD))
          ]),
          margin: EdgeInsets.fromLTRB(widthEnd!, height!/1.03, 0, 0),
          child: Text(
            endtext!,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 20,
                shadows: [Shadow(blurRadius: 10, color: Colors.blueAccent)],
                color: Colors.white70),
          ),
        ),
      ],
    );
  }

  static Widget feedbackContent({
    String? toptext,
    String? middletext,
    String? text1,
    String? text2,
    String? text3,
    String? text4,
    String? text5,
    double? height,
    double? width,
  }) {

    double fontsizeAll=height!/40;
    double fontsizeMid= height!/50;
    double fontsizeTop= height!/30;
    return

      Container(
      margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
      width: width!/1.5,
      child: Column(
          children: [
            Transform(
              transform: Matrix4.identity()
                ..scale(1.0,
                    1.8), // Adjust the vertical scale (2.0 for double height)
              alignment: Alignment.center,
              child: Text(
                toptext!,
                style: TextStyle(
                  fontSize: fontsizeTop,
                ),
              ),
            ),
            Text(
              '  \n',
            ),
            Text(
             middletext!,textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontsizeMid,
              ),
            ),
            Text(
              ' \n',
            ),
            Text(
               text1!,
              style: TextStyle(
                decoration: TextDecoration.none,
                shadows: [Shadow(color: Colors.white70, blurRadius: 20)],
                fontFamily: 'MyriadPro',
                fontSize: fontsizeAll,
                color: const Color(0xff000000),
              ),
            ),
            Text(
              ' \n',
            ),
            Text(
             text2!,
              style: TextStyle(
                fontSize: fontsizeAll,
              ),
            ),
            Text(
             ' \n',
            ),
            Text(
              text3!,
              style: TextStyle(
                fontSize: fontsizeAll,
              ),
            ),
            Text(
              ' \n',
            ),
            Text(
             text4!,
              style: TextStyle(
                fontSize: fontsizeAll,
              ),
            ),
            Text(
              ' \n',
            ),
            Text(
             text5!,
              style: TextStyle(
                fontSize: fontsizeAll,
              ),
            ),
            Text(
               ' \n',
            ),
          ],
        ),

    );
  }

  static Widget buttondate(
      {Function()? onPressed,
      double? height,
      double? width,
      Color? color,
      required String? text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onPressed,
            child: Container(
                height: 58,
                margin: EdgeInsets.fromLTRB(24, 0, 24, 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF655DBA), width: 0),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFF655DBA),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(text!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      )),
                )),
          ),
        ),
      ],
    );
  }

  static Widget button(
      {Function()? onPressed,
      required Widget child,
      double? height,
      double? width,
      Color? color}) {
    return SizedBox(
      width: width ?? 180,
      child: MaterialButton(
        onPressed: onPressed,
        height: height ?? 45,
        color: color ?? ColorUtils.black2,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: child,
      ),
    );
  }

  static PreferredSizeWidget appBar(String text,
      {IconButton? iconButton,
      TextStyle? textStyle,
      Color? backgroundColor,
      bool showTrailingButton = true,
      bool showActionList = false,
      List<Widget> actions = const []}) {
    return AppBar(
      title: Text(
        text,
        style: textStyle ?? StyleUtils.appBarTextStyle,
      ),
      centerTitle: true,
      leading: showTrailingButton
          ? IconButton(
              icon: iconButton ?? Icon(Icons.tab_outlined),
              onPressed: () {},
              color: iconButton != null ? ColorUtils.red : ColorUtils.black,
            )
          : Text(''),
      backgroundColor: backgroundColor ?? ColorUtils.red,
      actions: showActionList ? actions : [],
    );
  }

  static Widget textField2({
    Widget? startIcon,
    Widget? endIcon,
    double? height,
    EdgeInsets? padding,
    EdgeInsets? outerMargin,
    EdgeInsets? contentPadding,
    EdgeInsets? margins,
    InputDecoration? inputDecoration,
    TextStyle? textStyle,
    String? hint,
    TextStyle? hintStyle,
    String? label,
    TextStyle? labelStyle,
    Widget? startMobileIcon,
    Function(String)? onInputChanged,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyBoardType,
    String defaultText = "",
    TextEditingController? controller,
    bool editable = true,
    Iterable<String>? autofillHints,
  }) {
    if (controller == null) {
      return Container(
        height: height ?? 46,
        padding: padding ?? const EdgeInsets.only(right: 10, left: 10),
        margin: outerMargin ?? EdgeInsets.zero,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0.5, 2),
                  color: Colors.black12,
                  blurRadius: .5,
                  spreadRadius: 1),
              BoxShadow(
                  offset: Offset(-0.1, -0.1),
                  color: Colors.black12,
                  blurRadius: .7,
                  spreadRadius: .3)
            ]),
        child: Row(
          children: [
            startMobileIcon ?? const SizedBox.shrink(),
            startIcon ?? const SizedBox.shrink(),
            Flexible(
              child: TextField(
                decoration: inputDecoration ??
                    InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: contentPadding ??
                          const EdgeInsets.only(right: 15, left: 15),
                      hintText: hint ?? "",
                      hintStyle: hintStyle ?? const TextStyle(),
                      labelStyle: labelStyle ?? const TextStyle(),
                    ),
                style: textStyle ??
                    TextStyle(fontSize: 21, color: ColorUtils.white),
                onChanged: (str) => onInputChanged!(str),
                inputFormatters: inputFormatters ?? [],
                keyboardType: keyBoardType ?? TextInputType.text,
                enabled: editable,
                autofillHints: autofillHints ?? [],
              ),
            ),
            endIcon ?? const SizedBox.shrink(),
          ],
        ),
      );
    }

    return Container(
      height: height ?? 46,
      padding: padding ?? const EdgeInsets.only(right: 10, left: 10),
      margin: outerMargin ?? EdgeInsets.zero,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0.5, 2),
                color: Colors.black12,
                blurRadius: .5,
                spreadRadius: 1),
            BoxShadow(
                offset: Offset(-0.1, -0.1),
                color: Colors.black12,
                blurRadius: .7,
                spreadRadius: .3)
          ]),
      child: Row(
        children: [
          startMobileIcon ?? const SizedBox.shrink(),
          startIcon ?? const SizedBox.shrink(),
          Flexible(
            child: TextField(
              controller: controller,
              decoration: inputDecoration ??
                  InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: contentPadding ??
                          const EdgeInsets.only(right: 15, left: 15),
                      hintText: hint ?? "",
                      hintStyle: hintStyle ?? const TextStyle(),
                      labelStyle: labelStyle ?? const TextStyle()),
              style:
                  textStyle ?? TextStyle(fontSize: 21, color: ColorUtils.white),
              onChanged: (str) => onInputChanged!(str),
              inputFormatters: inputFormatters ?? [],
              keyboardType: keyBoardType ?? TextInputType.text,
              onTap: () {
                controller.selection = TextSelection.fromPosition(
                    TextPosition(offset: controller.text.length));
              },
              enabled: editable,
              autofillHints: autofillHints ?? [],
            ),
          ),
          endIcon ?? const SizedBox.shrink(),
        ],
      ),
    );
  }

  static Widget passTextField2(
    bool obscureText, {
    Widget? startIcon,
    Widget? endIcon,
    double? height,
    EdgeInsets? padding,
    EdgeInsets? contentPadding,
    EdgeInsets? margins,
    InputDecoration? inputDecoration,
    TextStyle? textStyle,
    String? hint,
    TextStyle? hintStyle,
    String? label,
    TextStyle? labelStyle,
    Widget? startMobileIcon,
    Function()? visibility,
    Function(String)? onInputChanged,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyBoardType,
    String defaultText = "",
    TextEditingController? controller,
    bool editable = true,
    Iterable<String>? autofillHints,
  }) {
    if (controller == null) {
      return Container(
        height: height ?? 46,
        padding: padding ?? const EdgeInsets.only(right: 10, left: 10),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0.5, 2),
                  color: Colors.black12,
                  blurRadius: .5,
                  spreadRadius: 1),
              BoxShadow(
                  offset: Offset(-0.1, -0.1),
                  color: Colors.black12,
                  blurRadius: .7,
                  spreadRadius: .3)
            ]),
        child: Row(
          children: [
            startMobileIcon ?? const SizedBox.shrink(),
            startIcon ?? const SizedBox.shrink(),
            Flexible(
              child: TextField(
                //obscureText: obscureText,
                decoration: inputDecoration ??
                    InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: contentPadding ??
                          const EdgeInsets.only(right: 15, left: 15, top: 10),
                      hintText: hint ?? "",
                      hintStyle: hintStyle ?? const TextStyle(),
                      labelStyle: labelStyle ?? const TextStyle(),
                      suffixIcon: IconButton(
                        padding: EdgeInsets.all(0.0),
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          color:
                              obscureText ? ColorUtils.white : ColorUtils.white,
                        ),
                        onPressed: visibility,
                      ),
                    ),
                style: textStyle ??
                    TextStyle(fontSize: 16, color: ColorUtils.white),
                onChanged: (str) => onInputChanged!(str),
                inputFormatters: inputFormatters ?? [],
                keyboardType: keyBoardType ?? TextInputType.text,
                enabled: editable,
                autofillHints: autofillHints ?? [],
              ),
            ),
            endIcon ?? const SizedBox.shrink(),
          ],
        ),
      );
    }

    return Container(
      height: height ?? 46,
      padding: padding ?? const EdgeInsets.only(right: 10, left: 10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0.5, 2),
                color: Colors.black12,
                blurRadius: .5,
                spreadRadius: 1),
            BoxShadow(
                offset: Offset(-0.1, -0.1),
                color: Colors.black12,
                blurRadius: .7,
                spreadRadius: .3)
          ]),
      child: Row(
        children: [
          startMobileIcon ?? const SizedBox.shrink(),
          startIcon ?? const SizedBox.shrink(),
          Flexible(
            child: TextField(
              obscureText: obscureText,
              controller: controller,
              decoration: inputDecoration ??
                  InputDecoration(
                    isDense: true,
                    suffixIconConstraints: BoxConstraints(
                      minWidth: 4,
                      minHeight: 4,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: contentPadding ??
                        const EdgeInsets.only(right: 15, left: 15),
                    hintText: hint ?? "",
                    hintStyle: hintStyle ?? const TextStyle(),
                    labelStyle: labelStyle ?? const TextStyle(),
                    suffixIcon: GestureDetector(
                      onTap: visibility,
                      child: Icon(obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
              style:
                  textStyle ?? TextStyle(fontSize: 21, color: ColorUtils.white),
              onChanged: (str) => onInputChanged!(str),
              inputFormatters: inputFormatters ?? [],
              keyboardType: keyBoardType ?? TextInputType.text,
              onTap: () {
                controller.selection = TextSelection.fromPosition(
                    TextPosition(offset: controller.text.length));
              },
              enabled: editable,
              autofillHints: autofillHints ?? [],
            ),
          ),
          endIcon ?? const SizedBox.shrink(),
        ],
      ),
    );
  }

  static Widget textField(
      {Widget? startIcon,
      Widget? endIcon,
      double? height,
      EdgeInsets? padding,
      EdgeInsets? outerMargin,
      EdgeInsets? contentPadding,
      EdgeInsets? margins,
      InputDecoration? inputDecoration,
      TextStyle? textStyle,
      String? hint,
      TextStyle? hintStyle,
      String? label,
      TextStyle? labelStyle,
      Widget? startMobileIcon,
      Function(String)? onInputChanged,
      List<TextInputFormatter>? inputFormatters,
      TextInputType? keyBoardType,
      String defaultText = "",
      TextEditingController? controller,
      bool editable = true}) {
    if (controller == null) {
      return Container(
        height: height ?? 46,
        padding: padding ?? const EdgeInsets.only(right: 10, left: 10),
        margin: outerMargin ?? EdgeInsets.zero,
        decoration: BoxDecoration(
          color: ColorUtils.lightGrey,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            startMobileIcon ?? const SizedBox.shrink(),
            startIcon ?? const SizedBox.shrink(),
            Flexible(
              child: TextField(
                decoration: inputDecoration ??
                    InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: contentPadding ??
                          const EdgeInsets.only(right: 15, left: 15),
                      hintText: hint ?? "",
                      hintStyle: hintStyle ?? const TextStyle(),
                      labelStyle: labelStyle ?? const TextStyle(),
                    ),
                style: textStyle ??
                    TextStyle(fontSize: 21, color: ColorUtils.white),
                onChanged: (str) => onInputChanged!(str),
                inputFormatters: inputFormatters ?? [],
                keyboardType: keyBoardType ?? TextInputType.text,
                enabled: editable,
              ),
            ),
            endIcon ?? const SizedBox.shrink(),
          ],
        ),
      );
    }

    return Container(
      height: height ?? 46,
      padding: padding ?? const EdgeInsets.only(right: 10, left: 10),
      margin: outerMargin ?? EdgeInsets.zero,
      child: Row(
        children: [
          startMobileIcon ?? const SizedBox.shrink(),
          startIcon ?? const SizedBox.shrink(),
          Flexible(
            child: TextField(
              controller: controller,
              decoration: inputDecoration ??
                  InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: contentPadding ??
                          const EdgeInsets.only(right: 15, left: 15),
                      hintText: hint ?? "",
                      hintStyle: hintStyle ?? const TextStyle(),
                      labelStyle: labelStyle ?? const TextStyle()),
              style:
                  textStyle ?? TextStyle(fontSize: 21, color: ColorUtils.white),
              onChanged: (str) => onInputChanged!(str),
              inputFormatters: inputFormatters ?? [],
              keyboardType: keyBoardType ?? TextInputType.text,
              onTap: () {
                controller.selection = TextSelection.fromPosition(
                    TextPosition(offset: controller.text.length));
              },
              enabled: editable,
            ),
          ),
          endIcon ?? const SizedBox.shrink(),
        ],
      ),
    );
  }

  static Widget passTextField(bool obscureText,
      {Widget? startIcon,
      Widget? endIcon,
      double? height,
      EdgeInsets? padding,
      EdgeInsets? contentPadding,
      EdgeInsets? margins,
      InputDecoration? inputDecoration,
      TextStyle? textStyle,
      String? hint,
      TextStyle? hintStyle,
      String? label,
      TextStyle? labelStyle,
      Widget? startMobileIcon,
      Function()? visibility,
      Function(String)? onInputChanged,
      List<TextInputFormatter>? inputFormatters,
      TextInputType? keyBoardType,
      String defaultText = "",
      TextEditingController? controller,
      bool editable = true}) {
    if (controller == null) {
      return Container(
        height: height ?? 46,
        padding: padding ?? const EdgeInsets.only(right: 10, left: 10),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0.5, 2),
                  color: Colors.black12,
                  blurRadius: .5,
                  spreadRadius: 1),
              BoxShadow(
                  offset: Offset(-0.1, -0.1),
                  color: Colors.black12,
                  blurRadius: .7,
                  spreadRadius: .3)
            ]),
        child: Row(
          children: [
            startMobileIcon ?? const SizedBox.shrink(),
            startIcon ?? const SizedBox.shrink(),
            Flexible(
              child: TextField(
                obscureText: obscureText,
                decoration: inputDecoration ??
                    InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding:
                          contentPadding ?? EdgeInsets.only(top: 40),
                      hintText: hint ?? "",
                      hintStyle: hintStyle ?? const TextStyle(),
                      labelStyle: labelStyle ?? const TextStyle(),
                      suffixIcon: IconButton(
                        padding: EdgeInsets.all(0.0),
                        icon: obscureText
                            ? Icon(Icons.visibility_off, color: ColorUtils.red)
                            : Icon(Icons.visibility, color: ColorUtils.red),
                        onPressed: visibility,
                      ),
                    ),
                style: textStyle ??
                    TextStyle(fontSize: 21, color: ColorUtils.white),
                onChanged: (str) => onInputChanged!(str),
                inputFormatters: inputFormatters ?? [],
                keyboardType: keyBoardType ?? TextInputType.text,
                enabled: editable,
              ),
            ),
            endIcon ?? const SizedBox.shrink(),
          ],
        ),
      );
    }

    return Container(
      height: height ?? 46,
      padding: padding ?? const EdgeInsets.only(right: 10, left: 10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0.5, 2),
                color: Colors.black12,
                blurRadius: .5,
                spreadRadius: 1),
            BoxShadow(
                offset: Offset(-0.1, -0.1),
                color: Colors.black12,
                blurRadius: .7,
                spreadRadius: .3)
          ]),
      child: Row(
        children: [
          startMobileIcon ?? const SizedBox.shrink(),
          startIcon ?? const SizedBox.shrink(),
          Flexible(
            child: TextField(
              obscureText: obscureText,
              controller: controller,
              decoration: inputDecoration ??
                  InputDecoration(
                    isDense: true,
                    suffixIconConstraints: BoxConstraints(
                      minWidth: 4,
                      minHeight: 4,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: contentPadding ??
                        const EdgeInsets.only(right: 15, left: 15),
                    hintText: hint ?? "",
                    hintStyle: hintStyle ?? const TextStyle(),
                    labelStyle: labelStyle ?? const TextStyle(),
                    // suffixIcon: IconButton(
                    //   padding: EdgeInsets.all(9.0),
                    //   icon: Icon(
                    //     obscureText ? Icons.visibility_off : Icons.visibility,
                    //     color: obscureText ? ColorUtils.darkBlue : ColorUtils.cyan,
                    //   ),
                    //   onPressed: visibility,
                    // ),
                    suffixIcon: GestureDetector(
                      onTap: visibility,
                      child: Icon(obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
              style:
                  textStyle ?? TextStyle(fontSize: 21, color: ColorUtils.white),
              onChanged: (str) => onInputChanged!(str),
              inputFormatters: inputFormatters ?? [],
              keyboardType: keyBoardType ?? TextInputType.text,
              onTap: () {
                controller.selection = TextSelection.fromPosition(
                    TextPosition(offset: controller.text.length));
              },
              enabled: editable,
            ),
          ),
          endIcon ?? const SizedBox.shrink(),
        ],
      ),
    );
  }

  static Widget whiteBox(
    context,
    title, {
    subText,
    width,
    height,
    color,
    icon,
    radius,
    hPading,
    vPading,
    hmargin,
    vmargin,
    textSize,
    subTextSize,
    titleColor,
    headingStyle,
    Function()? onPressed,
    bool? showIcon = false,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: hmargin ?? SizeUtils.widthInRatio(context, .1),
            vertical: vmargin ?? 0.0),
        height: height ?? SizeUtils.heightInRatio(context, .12),
        width: width ?? double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: hPading ?? 20, vertical: vPading ?? 0.0),
        decoration: BoxDecoration(
            color: color ?? ColorUtils.white,
            borderRadius: BorderRadius.circular(radius ?? 45),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(.5, 3),
                  spreadRadius: .5,
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (title != "")
              Text(
                title,
                textAlign: TextAlign.center,
                style: headingStyle ??
                    TextStyle(
                        fontSize: textSize ?? 24,
                        fontWeight: FontWeight.w500,
                        fontFamily: FontUtils.poppinsMedium,
                        color: titleColor ?? ColorUtils.red),
              ),
            if (title != "" && subText != "")
              const SizedBox(
                height: 10,
              ),
            if (subText != "")
              Text(
                subText ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: subTextSize ?? 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontUtils.poppinsRegular),
              ),
            if (showIcon!) icon,
          ],
        ),
      ),
    );
  }

  static Widget ruleBox(context, title,
      {subText,
      width,
      height,
      color,
      icon,
      radius,
      hPading,
      vPading,
      hmargin,
      vmargin,
      textSize,
      subTextSize,
      titleColor,
      subTitleColor,
      Function()? onPressed,
      widget,
      alignment}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: hmargin ?? SizeUtils.widthInRatio(context, .1),
            vertical: vmargin ?? 0.0),
        height: height /*?? SizeUtils.heightInRatio(context, .12)*/,
        width: width ?? double.infinity,
        alignment: alignment ?? Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: hPading ?? 20, vertical: vPading ?? 0.0),
        decoration: BoxDecoration(
            color: color ?? ColorUtils.white,
            borderRadius: BorderRadius.circular(radius ?? 45),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(.5, 3),
                  spreadRadius: .5,
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) icon,
            if (title != "")
              Text(
                title,
                style: TextStyle(
                    fontSize: textSize ?? 27,
                    fontWeight: FontWeight.w500,
                    fontFamily: FontUtils.poppinsMedium,
                    color: titleColor ?? ColorUtils.red),
              ),
            if (title != "" && subText != "")
              const SizedBox(
                height: 10,
              ),
            if (subText != "")
              Text(
                subText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: subTitleColor ?? Colors.black45,
                    fontSize: subTextSize ?? 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontUtils.poppinsRegular),
              ),
            widget
          ],
        ),
      ),
    );
  }

  static Widget roundedBox(
      {required BuildContext context,
      required Widget child,
      Color? backgroundColor,
      double? borderRadius,
      double? height,
      bool shadowEnabled = false,
      TextStyle? headingTextStyle,
      EdgeInsets? padding,
      EdgeInsets? margin,
      border}) {
    return Container(
      margin: margin ??
          EdgeInsets.symmetric(
              horizontal: SizeUtils.widthInRatio(context, .1), vertical: 5),
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      height: height ?? SizeUtils.heightInRatio(context, .2),
      // width: double.infinity,
      alignment: Alignment.center,

      decoration: BoxDecoration(
          color: backgroundColor ?? ColorUtils.white,
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          border: border,
          boxShadow: [
            if (shadowEnabled)
              const BoxShadow(
                  color: Colors.black12,
                  offset: Offset(.1, 1),
                  spreadRadius: .1,
                  blurRadius: 2)
          ]),
      child: child,
    );
  }

  static showToast(context, String msg, {dur}) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: TextStyle(fontSize: 15),
      ),
      duration: Duration(milliseconds: dur ?? 1000),
      elevation: 2,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    ));
  }

  static showProgress({Color? color, double? strokeWidth, double? size}) {
    return Center(
      child: SizedBox(
        width: size ?? 40,
        height: size ?? 40,
        child: CircularProgressIndicator(
          color: color ?? ColorUtils.white,
          strokeWidth: strokeWidth ?? 4,
        ),
      ),
    );
  }

  static removeFocus() {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
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
