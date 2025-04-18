import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.defaultSize! * 3),
      child: Row(
        children: [
          Image.asset(
            AssetsData.logo,
            height: SizeConfig.defaultSize! * 2,
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: SizeConfig.defaultSize! * 3,
              ))
        ],
      ),
    );
  }
}
