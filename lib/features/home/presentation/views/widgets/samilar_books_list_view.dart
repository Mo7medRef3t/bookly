import 'package:bookly/core/utils/size_config.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class SamilarBooksListView extends StatelessWidget {
  const SamilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: CustomImage(),
          );
        },
      ),
    );
  }
}
