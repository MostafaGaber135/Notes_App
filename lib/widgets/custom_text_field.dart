import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget{
  const CustomTextField({Key? key, required this.hint, this.maxLines =1}) : super(key: key);

  final String hint;
  final int maxLines;
  @override
  Widget build(BuildContext context){
    return TextField(
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hint,
        hintMaxLines: maxLines,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: color ?? Colors.white)
      );
  }
}