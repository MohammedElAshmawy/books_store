import 'package:book_store/Features/home/data/models/books_model.dart';
import 'package:book_store/Features/home/data/repository/home_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepository) : super(SearchInitial());

  static SearchCubit get(context)=>BlocProvider.of(context);

  final HomeRepository homeRepository;

  TextEditingController searchController=TextEditingController();


  Future<void> getSearchData() async {
   emit(SearchLoadingState());
   var result=await homeRepository.getSearchResult(
       searchInfo: searchController.text
   );
   result.fold(
           (failure) {
             emit(SearchErrorState(failure.errMessage));
           },
           (books) {
             print(books);
             emit(SearchSuccessState(books));
           });
  }
}
