import 'package:bookly/core/utils/size_config.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/core/widgets/space_widget.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    final category = bookModel.items.isNotEmpty == true
        ? bookModel.items[0].volumeInfo?.categories?.isNotEmpty == true
            ? bookModel.items[0].volumeInfo!.categories![0]
            : bookModel.items[0].volumeInfo?.title?.split(' ').first ??
                'General'
        : 'General';

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<SimilarBooksCubit>()
          .fetchSimilarBooks(category, currentBook: bookModel);
    });

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close)),
                ),
                SizedBox(
                  height: SizeConfig.defaultSize! * 22,
                  child: CustomImage(
                    imaheUrl: bookModel.items.isNotEmpty == true
                        ? bookModel
                                .items[0].volumeInfo?.imageLinks?.thumbnail ??
                            'https://via.placeholder.com/150'
                        : 'https://via.placeholder.com/150',
                  ),
                ),
                const VerticalSpace(4),
                Text(
                  bookModel.items.isNotEmpty == true
                      ? bookModel.items[0].volumeInfo?.title ?? 'No Title'
                      : 'No Title',
                  textAlign: TextAlign.center,
                  style: Styles.textStyle20gt.copyWith(fontSize: 30),
                ),
                const VerticalSpace(0.8),
                Text(
                  bookModel.items.isNotEmpty == true
                      ? bookModel.items[0].volumeInfo?.authors?.isNotEmpty ==
                              true
                          ? bookModel.items[0].volumeInfo!.authors![0]
                          : 'Unknown Author'
                      : 'Unknown Author',
                  style: Styles.textStyle18
                      .copyWith(fontWeight: FontWeight.normal),
                ),
                const VerticalSpace(1),
                BookRating(
                  rating: bookModel.items.isNotEmpty == true
                      ? bookModel.items[0].volumeInfo?.averageRating ?? 0
                      : 0,
                  count: bookModel.items.isNotEmpty == true
                      ? bookModel.items[0].volumeInfo?.ratingsCount ?? 0
                      : 0,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  child: Row(
                    children: [
                      Expanded(
                          child: CustomButton(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16)),
                        text: "Free",
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        onPressed: () {},
                      )),
                      Expanded(
                        child: CustomButton(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(16),
                              bottomRight: Radius.circular(16)),
                          text: "Preview",
                          backgroundColor: const Color(0xFFEF8262),
                          textColor: Colors.white,
                          onPressed: () async {
                            final previewLink =
                                bookModel.items.isNotEmpty == true
                                    ? bookModel.items[0].volumeInfo?.previewLink
                                    : null;
                            if (previewLink != null) {
                              final uri = Uri.parse(previewLink);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri,
                                    mode: LaunchMode.externalApplication);
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    height: 25,
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "You Can also like",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                const VerticalSpace(1),
                const SimilarBooksListView(),
                const VerticalSpace(2),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
