import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookDetailsAppbar extends StatelessWidget {
  const CustomBookDetailsAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: (){
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.close)),
        const Spacer(),
        IconButton(
            onPressed: (){},
            icon: const Icon(Icons.shopping_cart_outlined)),
      ],
    );
  }
}
