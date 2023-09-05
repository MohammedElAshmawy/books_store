import 'package:book_store/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class SearchBookRatingRow extends StatelessWidget {
  const SearchBookRatingRow({Key? key, this.mainAxisAlignment=MainAxisAlignment.start}) : super(key: key);

  final MainAxisAlignment mainAxisAlignment;

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
        const Text("5"),
        const SizedBox(
          width: 6,
        ),
        Text(
          "155",
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w300,
            color: HexColor("#707070"),
          ),
        )
      ],
    );
  }
}
