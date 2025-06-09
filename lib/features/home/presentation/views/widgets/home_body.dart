import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'newest_books_list_view.dart';
import 'custom_app_bar.dart';
import 'feature_books_list_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                CustomAppBar(),
                FeaturedBooksListView(),
                VerticalSpace(2),
                Text(
                  "Newest Books",
                  style: Styles.textStyle18,
                ),
              ])),
          SliverToBoxAdapter(
            child: NewestBooksListView(),
          )
        ],
      ),
    );
  }
}
