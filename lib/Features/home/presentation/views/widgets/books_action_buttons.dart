import 'package:book_store/Core/funtions/launch_url.dart';
import 'package:book_store/Core/widgets/custom_button.dart';
import 'package:book_store/Features/home/data/models/books_model.dart';
import 'package:flutter/material.dart';

class BooksActionButtons extends StatelessWidget {
  const BooksActionButtons({Key? key, required this.booksModel}) : super(key: key);

  final BooksModel booksModel;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
            child: CustomButton(
              onPressed: () {},
              text: 'Free',
              backGroundColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              textColor: Colors.black,
            )),

        Expanded(
            child: CustomButton(
              onPressed: ()  {
                launchCustomUrl(context, booksModel.volumeInfo.previewLink);
              },
              text: getText(booksModel),
              backGroundColor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              textColor: Colors.white,
            )),
      ],
    );
  }
}

String getText (BooksModel booksModel){
  if(booksModel.volumeInfo.previewLink==null){
    return "Not available";
  }else{
    return "Preview";
  }
}
