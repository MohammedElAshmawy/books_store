part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<BooksModel> books;
  SearchSuccessState(this.books);
}

class SearchErrorState extends SearchState {
  final String errMessage;
  SearchErrorState(this.errMessage);
}

