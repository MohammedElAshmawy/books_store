import 'package:book_store/Core/errors/failure.dart';
import 'package:book_store/Features/home/data/models/books_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository{

 Future<Either<Failure,List<BooksModel>>> fetchNewestBooks();
 Future<Either<Failure,List<BooksModel>>> fetchFeaturedBooks();
 Future<Either<Failure,List<BooksModel>>> getSearchResult({required String searchInfo});
 Future<Either<Failure,List<BooksModel>>> fetchSimilarBooks({required String category});

}