import 'package:book_store/Features/home/data/models/books_model.dart';
import 'package:book_store/Features/home/presentation/controller/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_store/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({Key? key, required this.booksModel}) : super(key: key);

  final BooksModel booksModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}


class _BookDetailsViewState extends State<BookDetailsView> {


  @override
  void initState() {
    print(widget.booksModel.volumeInfo.categories![0]);
    print("hereeeeeee");
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
        category: widget.booksModel.volumeInfo.categories![0]);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return  BookDetailsViewBody(
      booksModel: widget.booksModel);
  }
}
