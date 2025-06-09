import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint: "volumes?Filtering=free&q=subject:Programming&maxResults=40");
      List<BookModel> books = [];
      if (data['items'] != null) {
        books = (data['items'] as List<dynamic>)
            .map((item) => BookModel.fromJson({'items': [item]}))
            .toList();
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              "volumes?Filtering=free&q=computer science &Sorting=newest&maxResults=40");
      List<BookModel> books = [];
      if (data['items'] != null) {
        books = (data['items'] as List<dynamic>)
            .map((item) => BookModel.fromJson({'items': [item]}))
            .toList();
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchSearchedBooks(String title) async {
    try {
      var data = await apiService.get(
          endPoint: "volumes?Filtering=free&q=intitle:$title&maxResults=40");
      List<BookModel> books = [];
      if (data['items'] != null) {
        books = (data['items'] as List<dynamic>)
            .map((item) => BookModel.fromJson({'items': [item]}))
            .toList();
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
Future<Either<Failures, List<BookModel>>> fetchSimilarBooks(String category) async {
  try {
    final cleanedCategory = category.trim().replaceAll(' ', '+');
    var data = await apiService.get(
        endPoint:
            "volumes?Filtering=free&Sorting=relevance&q=subject:$cleanedCategory+intitle:$cleanedCategory&maxResults=40");
    List<BookModel> books = [];
    if (data['items'] != null) {
      books = (data['items'] as List<dynamic>)
          .map((item) => BookModel.fromJson({'items': [item]}))
          .toList();
    }
    return right(books);
  } catch (e) {
    if (e is DioException) {
      return left(ServerFailure.fromDioError(e));
    }
    return left(ServerFailure(e.toString()));
  }
}
}