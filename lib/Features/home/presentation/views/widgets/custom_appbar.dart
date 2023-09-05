import 'package:book_store/Core/utils/Constants.dart';
import 'package:book_store/Core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 40),
      child: Row(
        children: [
          Image.asset(AssetData.logo,
            height: 16,
          ),
          const Spacer(),
          IconButton(onPressed: (){
            GoRouter.of(context).push(AppRouter.searchPath);
          },
            icon: const Icon(FontAwesomeIcons.magnifyingGlass),
            iconSize: 18,
          )
        ],
      ),
    );
  }
}
