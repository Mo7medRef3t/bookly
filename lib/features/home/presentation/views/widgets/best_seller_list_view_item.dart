import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/size_config.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/space_widget.dart';
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
        padding: EdgeInsets.only(
            left: SizeConfig.defaultSize! * 3.2,
            bottom: SizeConfig.defaultSize! * 2),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: SizeConfig.defaultSize! * 7,
                height: SizeConfig.defaultSize! * 11,
                color: Colors.white,
                child: Image.asset(AssetsData.harryPotter, fit: BoxFit.cover),
              )),
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
                    const HorizantalSpace(4),
                    const Icon(Icons.star_rounded, color: Color(0xffFFDD4F)),
                    const HorizantalSpace(0.5),
                    Text("4.8",
                        style: Styles.textStyle18.copyWith(fontSize: 16)),
                    const HorizantalSpace(0.5),
                    Text("(2390)",
                        style: Styles.textStyle18.copyWith(
                            fontSize: 14, color: const Color(0xff707070)))
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
