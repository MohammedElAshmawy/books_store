import 'package:book_store/Core/utils/Constants.dart';
import 'package:book_store/Core/utils/styles.dart';
import 'package:book_store/Features/home/presentation/views/widgets/newest_books_listview.dart';
import 'package:book_store/Features/home/presentation/views/widgets/books_listview.dart';
import 'package:book_store/Features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          BooksListView(),
          SizedBox(height: 22,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text("Newest Books",
            style: Styles.textStyle18,),
          ),
          SizedBox(height: 22,),
          NewestBooksListVIew(),
        ],
      ),
    );
  }
}




