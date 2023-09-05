import 'package:book_store/Features/home/data/models/books_model.dart';
import 'package:book_store/Features/home/data/repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepository) : super(SimilarBooksInitial());


  final HomeRepository homeRepository;

  Future<void> fetchSimilarBooks({required String category}) async{
    emit(GetSimilarBooksLoadingState());
    var result= await homeRepository.fetchSimilarBooks(category: category);
    result.fold(
            (failure) {
          emit(GetSimilarBooksErrorState(failure.errMessage));
        },
            (books) {
          emit(GetSimilarBooksSuccessState(books));
        });
  }
}
