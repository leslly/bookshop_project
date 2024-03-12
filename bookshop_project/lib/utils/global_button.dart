import 'package:flutter/material.dart';

import 'global_colors.dart';


class GlobalButton extends StatelessWidget {
  const GlobalButton({Key? key, this.fontSize = 16, required this.colorOfText, required this.colorOfButton, this.text = 'Next', required this.nextPage}) : super(key: key);

  final String text;
  final VoidCallback nextPage;
  final Color colorOfButton;
  final Color colorOfText;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: nextPage,
      child: Container(
        alignment: Alignment.center,
        height: 34,
        width: 195,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: colorOfButton,
          border: Border.all(width: 1, color: GlobalColors.whiteTextColor),
        ),
        child:  Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            // fontWeight: FontWeight.bold,
            color: colorOfText,
          ),
        ),
      ),
    );
  }
}