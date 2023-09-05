import 'package:book_store/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key,
    required this.backGroundColor,
    required this.borderRadius,
    required this.text,
    required this.textColor,
    required this.onPressed}) : super(key: key);

  final Color backGroundColor;
  final Color textColor;
  final BorderRadius borderRadius;
  final String text;
  final void Function() onPressed;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: backGroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            )),
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.bold,
               color: textColor,
            fontSize: 16
          ),
        ),
      ),
    );
  }
}
