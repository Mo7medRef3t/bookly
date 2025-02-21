import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: SizeConfig.defaultSize! * 15,
        height: SizeConfig.defaultSize! * 21,
        margin: const EdgeInsets.symmetric(horizontal: 7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                fit: BoxFit.cover, image: AssetImage(AssetsData.jungle))));
  }
} 