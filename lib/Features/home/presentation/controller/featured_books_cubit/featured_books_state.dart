part of 'featured_books_cubit.dart';

abstract class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

class FeaturedBooksInitial extends FeaturedBooksState {

}

class GetFeaturedBooksLoadingState extends FeaturedBooksState {}

class GetFeaturedBooksSuccessState extends FeaturedBooksState {
  final List<BooksModel> books;
  const GetFeaturedBooksSuccessState(this.books);
}

class GetFeaturedBooksFailureState extends FeaturedBooksState {
  final String errMessage;
  const GetFeaturedBooksFailureState(this.errMessage);
}
