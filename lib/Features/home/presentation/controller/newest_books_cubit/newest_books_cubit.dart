import 'package:book_store/Features/home/data/models/books_model.dart';
import 'package:book_store/Features/home/data/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepository) : super(NewestBooksInitial());

  final HomeRepository homeRepository;

  Future<void> fetchNewestBooks() async{
    emit(GetNewestBooksLoadingState());
    var result= await homeRepository.fetchNewestBooks();
    result.fold(
            (failure) {
          emit(GetNewestBooksFailureState(failure.errMessage));
        },
            (books) {
          emit(GetNewestBooksSuccessState(books));
        });
  }
}
