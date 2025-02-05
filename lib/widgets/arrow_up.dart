import 'package:AshuTech/utils/colors.dart';
import 'package:flutter/material.dart';

class ArrowUp extends StatelessWidget {
  const ArrowUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: gradientColor),
      ),
      child: const Icon(
        Icons.arrow_upward,
        color: Colors.white,
        weight: 30,
      ),
    );
  }
}
