import 'package:book_store/Features/home/presentation/controller/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          return TextField(
            controller: SearchCubit.get(context).searchController,
            onSubmitted: (_) {
              SearchCubit.get(context).getSearchData();
            },
            decoration: InputDecoration(
                border: buildOutlineInputBorder(),
                focusedBorder: buildOutlineInputBorder(),
                hintText: "search",
                suffixIcon: const Icon(FontAwesomeIcons.magnifyingGlass,
                  size: 15,
                  color: Colors.white38,
                )
            ),
          );
        },
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Colors.white38,
      ),
    );
  }
}
