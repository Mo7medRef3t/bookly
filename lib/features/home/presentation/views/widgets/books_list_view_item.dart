import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/size_config.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/space_widget.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BooksListViewItem extends StatelessWidget {
  const BooksListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: bookModel);
      },
      child: Container(
        height: SizeConfig.defaultSize! * 13,
        padding: EdgeInsets.only(
            left: SizeConfig.defaultSize! * 1.2,
            bottom: SizeConfig.defaultSize! * 2),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImage(
            imaheUrl:
                bookModel.items[0].volumeInfo!.imageLinks?.thumbnail ?? '',
          ),
          const HorizantalSpace(3),
          SizedBox(
            width: SizeConfig.defaultSize! * 19,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(bookModel.items[0].volumeInfo!.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle20gt),
                Text(
                  bookModel.items[0].volumeInfo!.authors?[0] ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle18
                      .copyWith(fontSize: 14, fontWeight: FontWeight.normal),
                ),
                Row(
                  children: [
                    Text("Free",
                        style: Styles.textStyle18.copyWith(fontSize: 15)),
                    const Spacer(),
                    BookRating(
                      rating: bookModel.items[0].volumeInfo!.averageRating ?? 0,
                      count: bookModel.items[0].volumeInfo!.ratingsCount ?? 0,
                    )
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
