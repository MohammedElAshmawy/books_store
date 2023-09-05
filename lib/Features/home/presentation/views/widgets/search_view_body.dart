import 'package:book_store/Core/utils/styles.dart';
import 'package:book_store/Features/home/presentation/views/widgets/search_result_list_view.dart';
import 'package:book_store/Features/home/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15,),
            SearchTextField(),
            SizedBox(height: 25,),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text("search results",
                style: Styles.textStyle30,
                ),
              ),
            ),
            SizedBox(height: 20,),
            SearchResultListView(),
          ],
        ),
      ),
    );
  }
}