import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget{
  final controller;
  final String? hintText;
  final bool obscureText;
  
  const LoginTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child :TextField(

        controller: controller,
        obscureText: obscureText,

        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}