import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/size_config.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/space_widget.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: Container(
        height: SizeConfig.defaultSize! * 13,
        padding: EdgeInsets.only(
            left: SizeConfig.defaultSize! * 1.2,
            bottom: SizeConfig.defaultSize! * 2),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomImage(),
          const HorizantalSpace(3),
          SizedBox(
            width: SizeConfig.defaultSize! * 19,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Harry Potter and the Goblet of Fire",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle20gt),
                Text(
                  "J.K.Rowling",
                  style: Styles.textStyle18
                      .copyWith(fontSize: 14, fontWeight: FontWeight.normal),
                ),
                Row(
                  children: [
                    Text("19.99 €",
                        style: Styles.textStyle18.copyWith(fontSize: 15)),
                    const Spacer(),
                    const BookRating()
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
