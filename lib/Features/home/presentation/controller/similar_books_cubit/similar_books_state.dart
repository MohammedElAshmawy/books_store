part of 'similar_books_cubit.dart';

abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}

class GetSimilarBooksLoadingState extends SimilarBooksState {}

class GetSimilarBooksErrorState extends SimilarBooksState {
  final String errMessage;

  GetSimilarBooksErrorState(this.errMessage);
}

class GetSimilarBooksSuccessState extends SimilarBooksState {
  final List<BooksModel> books;

  GetSimilarBooksSuccessState(this.books);
}
