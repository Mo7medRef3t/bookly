import 'package:bookly/core/utils/size_config.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/core/widgets/space_widget.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/samilar_books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: SizeConfig.defaultSize! * 22,
                    child: const CustomImage()),
                const VerticalSpace(4),
                Text("The Jungle Book",
                    style: Styles.textStyle20gt.copyWith(fontSize: 30)),
                const VerticalSpace(0.8),
                Text(
                  "Rudyard Kipling",
                  style: Styles.textStyle18
                      .copyWith(fontWeight: FontWeight.normal),
                ),
                const VerticalSpace(1),
                const BookRating(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  child: Row(
                    children: [
                      Expanded(
                          child: CustomButton(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  bottomLeft: Radius.circular(16)),
                              text: "19.99\$",
                              backgroundColor: Colors.white,
                              textColor: Colors.black)),
                      Expanded(
                          child: CustomButton(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(16),
                                  bottomRight: Radius.circular(16)),
                              text: "Free Preview",
                              backgroundColor: Color(0xFFEF8262),
                              textColor: Colors.white)),
                    ],
                  ),
                ),
                const Expanded(
                    child: SizedBox(
                  height: 25,
                )),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "You Can also like",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                const VerticalSpace(1),
                const SamilarBooksListView(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
