import 'package:book_store/Core/utils/Constants.dart';
import 'package:book_store/Core/utils/styles.dart';
import 'package:book_store/Features/home/data/models/books_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class SearchResultListViewItem extends StatelessWidget {
  const SearchResultListViewItem({Key? key, required this.booksModel}) : super(key: key);

  final BooksModel booksModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         showMyDialog(
             context: context,
             description: booksModel.volumeInfo.authors![0].toString());
      },
      child: SizedBox(
        height: 135,
        width: 205,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.red,
                height: 160,
                width: 100,
                child: AspectRatio(
                  aspectRatio: 3 / 2.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: booksModel.volumeInfo.imageLinks?.thumbnail?? errorImage,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error_outline),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8,),
               Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      booksModel.volumeInfo.title.toString(),
                      style: Styles.textStyle18,
                       maxLines: 1,
                       overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8,),
                     Text(
                       booksModel.volumeInfo.authors.toString(),
                      style: Styles.textStyle16,
                       maxLines: 2,
                    ),
                    const SizedBox(height: 8,),
                    const SizedBox(height: 8,),
                    Expanded(
                      child: Text(
                        booksModel.volumeInfo.description.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyleSmall.copyWith(
                          fontSize: 12
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


void showMyDialog({
  required BuildContext context,
  required String description
}){
  QuickAlert.show(
      animType: QuickAlertAnimType.scale,
      context: context,
      title: "Description",
      type: QuickAlertType.custom,
      widget: SingleChildScrollView(
        child: Text(description,
        maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      )
  );
}
