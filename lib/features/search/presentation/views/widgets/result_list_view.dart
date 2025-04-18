import 'package:bookly/features/search/presentation/views/widgets/result_list_view_item.dart';
import 'package:flutter/material.dart';

class ResultListView extends StatelessWidget {
  const ResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ResultListViewItem();
      },
    );
  }
}
