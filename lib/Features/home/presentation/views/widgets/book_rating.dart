import 'package:book_store/Core/utils/styles.dart';
import 'package:book_store/Features/home/data/models/books_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class BookRatingRow extends StatelessWidget {
  const BookRatingRow({Key? key, this.mainAxisAlignment=MainAxisAlignment.start, required this.booksModel}) : super(key: key);

  final MainAxisAlignment mainAxisAlignment;
  final BooksModel booksModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: HexColor("#FFDD4F"),
          size: 15,
        ),
        const SizedBox(
          width: 6,
        ),
         Text(
          booksModel.volumeInfo.averageRating.toString(),
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          booksModel.volumeInfo.ratingsCount.toString(),
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w300,
            color: HexColor("#707070"),
          ),
        )
      ],
    );
  }
}
