import 'package:flutter/material.dart';

class CoustomTextTopBageCrate extends StatelessWidget {
  const CoustomTextTopBageCrate({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
