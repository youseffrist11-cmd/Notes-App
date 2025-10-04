import 'package:flutter/material.dart';
import 'package:notes_app/core/helper/colors_my_app.dart';

class CoustomtextfieldSignUp extends StatelessWidget {
  const CoustomtextfieldSignUp({
    super.key,
    required this.controller,
    required this.hintText,
    required this.name,
  });

  final TextEditingController controller;
  final String hintText;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextFormField(
          controller: controller,
          obscureText: name == 'Password',
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xff221823),
            hintText: hintText,
            hintStyle: TextStyle(color: ColorsMyApp.secondaryColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
