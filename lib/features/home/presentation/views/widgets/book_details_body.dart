import 'package:bookly/core/utils/size_config.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_list_view_item.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: SizeConfig.screenWidth,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FeaturedListViewItem()
        ],
      ),
    );
  }
}