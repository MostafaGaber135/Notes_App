// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
class CustomButton extends StatelessWidget{
  const CustomButton({Key? key, this.onTap, this.isLoading = false}) : super(key: key);

  final void Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
      child: Container(
      
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(16)
        ),
        child:  Center(
          child: isLoading ? const SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          ) : const Text('add',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          ),
          ),
          ),
      ),
    );
  }
}