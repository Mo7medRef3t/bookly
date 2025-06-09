import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  final HomeRepo homeRepo;
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  Future<void> fetchSimilarBooks(String category, {BookModel? currentBook}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category);
    result.fold(
      (failure) {
        emit(SimilarBooksFailure(errMessage: failure.errMessage));
      },
      (books) {
        if (currentBook != null) {
          books.removeWhere((book) =>
              book.items.isNotEmpty &&
              currentBook.items.isNotEmpty &&
              book.items[0].id == currentBook.items[0].id);
        }
        emit(SimilarBooksSuccess(books));
      },
    );
  }
}