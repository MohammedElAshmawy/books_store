import 'package:book_store/Core/widgets/search_error_widget.dart';
import 'package:book_store/Features/home/presentation/controller/search_cubit/search_cubit.dart';
import 'package:book_store/Features/home/presentation/views/widgets/search_result_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SearchCubit,SearchState>(
        builder: (context,state){
          if(state is SearchSuccessState) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context,index){
                return   Padding(
                  padding:const  EdgeInsets.symmetric(vertical: 8.0),
                  child: SearchResultListViewItem(
                    booksModel: state.books[index],),
                );
              });
          }else if (state is SearchErrorState){
            return const SearchErrorWidget();
          }else {


            return const Center(child: Text("THERE IS NO SEARCH RESULT YET "));
          }
        },
      ),
    );
  }
}
