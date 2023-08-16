
import 'package:flutter/material.dart';

import '../utils/color_utils.dart';

class SearchWidget extends StatelessWidget {
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final String? hintText;
  final InputDecoration? inputDecoration;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;

  const SearchWidget({
    Key? key,
    this.margin,
    this.padding,
    this.hintText,
    this.inputDecoration,
    this.contentPadding,
    this.hintStyle,
    this.labelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            width: double.infinity,
            padding: padding ?? const EdgeInsets.only(left: 10, right: 10),
            margin: margin ?? EdgeInsets.zero,
            constraints: const BoxConstraints(minHeight: 45),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ColorUtils.black, width: 2)),
            child: TextField(
              decoration: inputDecoration ??
                  InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: contentPadding ?? EdgeInsets.zero,
                    hintText: hintText ?? "Search By Address",
                    hintStyle: hintStyle ?? const TextStyle(),
                    labelStyle: labelStyle ?? const TextStyle(),
                  ),
            ),
          ),
        )
      ],
    );
  }
}
