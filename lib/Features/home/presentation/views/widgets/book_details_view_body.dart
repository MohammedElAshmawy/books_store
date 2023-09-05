import 'package:book_store/Core/utils/styles.dart';
import 'package:book_store/Features/home/data/models/books_model.dart';
import 'package:book_store/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:book_store/Features/home/presentation/views/widgets/books_action_buttons.dart';
import 'package:book_store/Features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:book_store/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:book_store/Features/home/presentation/views/widgets/similar_books_listview.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.booksModel}) : super(key: key);

  final BooksModel booksModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomBookDetailsAppbar(),
                    const SizedBox(
                      height: 15,
                    ),
                     Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: SizedBox(
                          width:  200,
                          height: 300,
                          child: CustomBookImage(
                            imagePath:
                            booksModel.volumeInfo.imageLinks!.thumbnail??"",)),
                    ),
                    Text(booksModel.volumeInfo.title.toString(),
                      textAlign: TextAlign.center,
                      style: Styles.textStyle30.copyWith(
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height:
                    6,
                    ),
                    Text(booksModel.volumeInfo.authors![0],
                      style: Styles.textStyle18.copyWith(
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    const SizedBox(height:
                    8,),
                     BookRatingRow(
                      mainAxisAlignment: MainAxisAlignment.center,
                       booksModel: booksModel,
                    ),
                    const SizedBox(height: 30,),
                    BooksActionButtons(
                      booksModel: booksModel,),
                    const Expanded(
                        child: SizedBox(height: 30,)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("You can also like",
                        style: Styles.textStyle14.copyWith(
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                    const SizedBox(height: 20,),
                     SimilarBooksListView(
                       booksModel: booksModel,),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}



