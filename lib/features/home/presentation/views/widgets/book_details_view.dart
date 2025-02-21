import 'package:bookly/core/constants.dart';
import 'package:bookly/core/utils/size_config.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KMainColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close)),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: SizeConfig.defaultSize! * 1.5),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined))),
        ],
      ),
      body: const BookDetailsBody(),
    );
  }
}
