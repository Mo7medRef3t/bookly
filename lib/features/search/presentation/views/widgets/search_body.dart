import 'package:bookly/core/widgets/custom_search.dart';
import 'package:bookly/core/widgets/space_widget.dart';
import 'package:bookly/features/search/presentation/views/widgets/result_list_view.dart';
import 'package:flutter/material.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [CustomSearch(),
        VerticalSpace(2),
        Expanded(child: ResultListView())],
      ),
    );
  }
}
