import 'package:book_store/Core/errors/failure.dart';
import 'package:book_store/Core/utils/api_service.dart';
import 'package:book_store/Features/home/data/models/books_model.dart';
import 'package:book_store/Features/home/data/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation implements HomeRepository {
  final ApiService apiService;

  HomeRepoImplementation(this.apiService);

  @override
  Future<Either<Failure, List<BooksModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:science');
      List<BooksModel> books = [];
      for (var item in data['items']) {
        books.add(BooksModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioExceptionError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }


  @override
  Future<Either<Failure, List<BooksModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&Sorting=newest &q=subject:science');
      List<BooksModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BooksModel.fromJson(item));
        } catch (e) {
          books.add(BooksModel.fromJson(item));
        }
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioExceptionError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BooksModel>>> fetchSimilarBooks({required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:science');
      List<BooksModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BooksModel.fromJson(item));
        } catch (e) {
          books.add(BooksModel.fromJson(item));
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioExceptionError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BooksModel>>> getSearchResult({required String searchInfo}) async {
    try {
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&Sorting=relevance&q=$searchInfo');
      List<BooksModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BooksModel.fromJson(item));
        } catch (e) {
          books.add(BooksModel.fromJson(item));
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioExceptionError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}