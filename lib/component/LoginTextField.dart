import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget{
  //Variabel for controller, hintText, and obscureText
  final controller;
  final String? hintText;
  final bool obscureText;
  
  const LoginTextField({
    super.key,
    //Saying you required give these 3 variabel an input in the function.
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child :TextField(

        controller: controller, // Making the controller as the input controller.
        obscureText: obscureText, // Making the obscureText the input obscureText.

        decoration: InputDecoration(
          hintText: hintText, //Making the hintText the same as the input HhintText.
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // give circular border
          ),
        ),
      ),
    );
  }
}
