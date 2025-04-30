import 'package:bookly/core/utils/size_config.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.backgroundColor,
      required this.textColor,
      this.borderRadius});
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize! * 4.5,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(16))),
        child: Text(
          text,
          style: Styles.textStyle18
              .copyWith(fontWeight: FontWeight.w800, color: textColor),
        ),
      ),
    );
  }
}
