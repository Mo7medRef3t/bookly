import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 3 / 4,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(AssetsData.jungle, fit: BoxFit.fill)));
  }
}
