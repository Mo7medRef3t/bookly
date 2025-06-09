import 'package:bookly/features/home/presentation/manger/searched_books_cubit/searched_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedBooksCubit, SearchedBooksState>(
      builder: (context, state) {
        if (state is SearchedBooksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchedBooksSuccess) {
          if (state.books.isEmpty) {
            return const Center(child: Text('No books found.'));
          }
          return ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: BooksListViewItem(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is SearchedBooksFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: Text('Enter a search query to find books.'));
        }
      },
    );
  }
}