part of 'newest_books_cubit.dart';

abstract class NewestBooksState extends Equatable {
  const NewestBooksState();
  @override
  List<Object> get props => [];
}

class NewestBooksInitial extends NewestBooksState {}

class GetNewestBooksLoadingState extends NewestBooksState {}

class GetNewestBooksSuccessState extends NewestBooksState {
  final List<BooksModel> books;
  const GetNewestBooksSuccessState(this.books);
}

class GetNewestBooksFailureState extends NewestBooksState {
  final String errMessage;
  const GetNewestBooksFailureState(this.errMessage);
}
