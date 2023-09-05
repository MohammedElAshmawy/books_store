import 'package:book_store/Core/widgets/custom_error_widget.dart';
import 'package:book_store/Core/widgets/custom_indectaor.dart';
import 'package:book_store/Features/home/presentation/controller/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_book_image.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit,FeaturedBooksState>(
      builder: (context, state){
        if (state is GetFeaturedBooksSuccessState) {
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * .3,
            child: ListView.builder(
                itemCount: state.books.length,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: CustomBookImage(
                      imagePath:
                      state.books[index].volumeInfo.imageLinks!.thumbnail??""
                          ),
                  );
                }),
               );
        } else if(state is GetFeaturedBooksFailureState){
          return CustomErrorWidget(errMessage: state.errMessage);
        }else {
          return const CustomIndicator();
        }
      },
    );
  }
}