import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'searched_books_state.dart';

class SearchedBooksCubit extends Cubit<SearchedBooksState> {
  SearchedBooksCubit(this.homeRepo) : super(SearchedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSearchedBooks(String title) async {
    emit(SearchedBooksLoading());
    var result = await homeRepo.fetchSearchedBooks(title);
    result.fold((failure) {
      emit(SearchedBooksFailure(errMessage: failure.errMessage));
    }, (books) {
      emit(SearchedBooksSuccess(books));
    });
  }
}
