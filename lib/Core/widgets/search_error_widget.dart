import 'package:book_store/Core/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SearchErrorWidget extends StatelessWidget {
  const SearchErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       const Text("Sorry there is an error while saerching",
        style: Styles.textStyle30,
         textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15,),
        ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: SizedBox(
            height: 200,
            width: 300,
            child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: "https://img.freepik.com/free-vector/error-404-concept-landing-page_52683-12188.jpg?size=626&ext=jpg&ga=GA1.2.1350134099.1687032575&semt=ais"),
          ),
        )
      ],
    );
  }
}
