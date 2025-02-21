import 'package:bookly/core/utils/size_config.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';
import 'feature_books_list_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            const FeatureBooksListView(),
            Padding(
              padding: EdgeInsets.all(SizeConfig.defaultSize! * 3),
              child: const Text(
                "Best Seller",
                style: Styles.textStyle18,
              ),
            ),
          ]
          )
        ),
         const SliverToBoxAdapter(
          child: BestSellerListView(),

        )
          ],
        );
    
  }
}
