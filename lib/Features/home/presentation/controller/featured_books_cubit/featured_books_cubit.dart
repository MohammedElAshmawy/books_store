import 'package:book_store/Features/home/data/models/books_model.dart';
import 'package:book_store/Features/home/data/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepository) : super(FeaturedBooksInitial());

  final HomeRepository homeRepository;

  Future<void> fetchFeaturedBooks() async{
    emit(GetFeaturedBooksLoadingState());
    var result= await homeRepository.fetchFeaturedBooks();
    result.fold(
            (failure) {
              emit(GetFeaturedBooksFailureState(failure.errMessage));
            },
            (books) {
              print(books);
              emit(GetFeaturedBooksSuccessState(books));
            });
  }

}
