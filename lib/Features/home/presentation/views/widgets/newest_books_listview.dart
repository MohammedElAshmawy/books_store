import 'package:book_store/Core/widgets/custom_error_widget.dart';
import 'package:book_store/Core/widgets/custom_indectaor.dart';
import 'package:book_store/Features/home/presentation/controller/newest_books_cubit/newest_books_cubit.dart';
import 'package:book_store/Features/home/presentation/views/widgets/newest_books_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListVIew extends StatelessWidget {
  const NewestBooksListVIew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NewestBooksCubit,NewestBooksState>(
        builder: (BuildContext context, state) {
        if(state is GetNewestBooksSuccessState) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context,index) {
              if (state.books[index] != null){
                return NewestBooksListViewItem(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 8),
                  booksModel: state.books[index],
                );
            }else{
                return const Text("data");
              }
            });
        }else if (state is GetNewestBooksFailureState){
          return CustomErrorWidget(errMessage: state.errMessage);
        }else {
          return const CustomIndicator();
        }
      },
      ),
    );
  }
}