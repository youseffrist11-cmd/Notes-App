import 'package:flutter/material.dart';

class CoustomTextButtonHome extends StatelessWidget {
  const CoustomTextButtonHome({super.key, required this.name, this.onPressed});
  final String name;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
