import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_search.dart';
import 'package:bookly/core/widgets/space_widget.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearch(),
          VerticalSpace(1),
          Text(
            "Search Result",
            style: Styles.textStyle18,
          ),
          VerticalSpace(2),
          Expanded(child: SearchResultListView())
        ],
      ),
    );
  }
}
