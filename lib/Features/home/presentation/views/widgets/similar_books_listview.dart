import 'package:book_store/Core/widgets/custom_error_widget.dart';
import 'package:book_store/Core/widgets/custom_indectaor.dart';
import 'package:book_store/Features/home/data/models/books_model.dart';
import 'package:book_store/Features/home/presentation/controller/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_store/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({Key? key, required this.booksModel}) : super(key: key);

  final BooksModel booksModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit,SimilarBooksState>(
      builder: (BuildContext context, state) {
        if(state is GetSimilarBooksSuccessState) {
          return SizedBox(
          height: MediaQuery.of(context).size.height * .2,
          child: ListView.builder(
            itemCount: state.books.length,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: CustomBookImage(
                    imagePath:state.books[index].volumeInfo.imageLinks!.thumbnail??""),
                );
              }),
        );
        }else if(state is GetSimilarBooksErrorState) {
          return CustomErrorWidget(errMessage: state.errMessage);
        }else {
          return const CustomIndicator();
        }
      },
    );
  }
}
