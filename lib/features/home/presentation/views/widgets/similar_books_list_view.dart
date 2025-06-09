import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/size_config.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          if (state.books.isEmpty) {
            return const Center(
              child: Text(
                'No similar books found',
                style: Styles.textStyle18,
              ),
            );
          }
          return SizedBox(
            height: SizeConfig.screenHeight! * 0.2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                final book = state.books[index];
                final item = book.items.isNotEmpty ? book.items[0] : null;
                if (item == null || item.volumeInfo == null) {
                  return const SizedBox.shrink();
                }
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.kBookDetailsView,
                      extra: book,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: CustomImage(
                      imaheUrl: item.volumeInfo!.imageLinks?.thumbnail ?? 'https://via.placeholder.com/150',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: Styles.textStyle18,
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}