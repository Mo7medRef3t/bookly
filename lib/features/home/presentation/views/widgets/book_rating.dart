import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key, this.mainAxisAlignment = MainAxisAlignment.start, required this.rating, required this.count});
  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(Icons.star_rounded, color: Color(0xffFFDD4F)),
        const HorizantalSpace(0.5),
        Text('$rating', style: Styles.textStyle18.copyWith(fontSize: 16)),
        const HorizantalSpace(0.5),
        Text("($count)",
            style: Styles.textStyle18
                .copyWith(fontSize: 14, color: const Color(0xff707070)))
      ],
    );
  }
}
