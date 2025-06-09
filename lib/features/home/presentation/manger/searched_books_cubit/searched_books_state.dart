part of 'searched_books_cubit.dart';

sealed class SearchedBooksState extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchedBooksInitial extends SearchedBooksState {}

class SearchedBooksLoading extends SearchedBooksState {}

class SearchedBooksSuccess extends SearchedBooksState {
  final List<BookModel> books;
  SearchedBooksSuccess(this.books);
  @override
  List<Object> get props => [books];
}

class SearchedBooksFailure extends SearchedBooksState {
  final String errMessage;
  SearchedBooksFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}