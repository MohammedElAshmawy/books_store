import 'package:book_store/Core/utils/styles.dart';
import 'package:book_store/Core/utils/app_router.dart';
import 'package:book_store/Features/home/data/models/books_model.dart';
import 'package:book_store/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewestBooksListViewItem extends StatelessWidget {
  const NewestBooksListViewItem({Key? key, required this.padding,
    required this.booksModel}) : super(key: key);

  final BooksModel booksModel;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(
            AppRouter.bookDetailsPath,
             extra: booksModel
        );
      },
      child: SizedBox(
        height: 150,
        child: Padding(
          padding: padding,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 2.6 / 4.5,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image:  DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              booksModel.volumeInfo.imageLinks!.thumbnail??"Unknown"))),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        booksModel.volumeInfo.title.toString(),
                        style: Styles.textStyle20.copyWith(fontSize: 16),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      booksModel.volumeInfo.authors == null
                          ? "Unknown"
                          : booksModel.volumeInfo.authors.toString(),
                      style: Styles.textStyleNormal16,
                    ),
                    Row(
                      children: [
                        Text(
                          "Free",
                          style: Styles.textStyle16.copyWith(
                            color: Colors.amber
                          ),
                        ),
                        const Spacer(),
                         BookRatingRow(booksModel: booksModel,),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}