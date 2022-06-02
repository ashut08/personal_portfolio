import 'package:flutter/material.dart';
import 'package:personal_portfolio/utils/constant.dart';

Widget aboutMe() {
  return Container(
    width: 100,
    decoration: const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: kPrimaryColor,
          spreadRadius: 10,
          blurRadius: 10,
          offset: Offset(
            0,
            4,
          ),
        )
      ],
    ),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      const Text(
        "About Me",
        style: TextStyle(color: Colors.white),
      ),
      Container(
        padding: const EdgeInsets.all(5),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: const Icon(Icons.arrow_downward_sharp,
            color: kPrimaryColor, size: 10),
      )
    ]),
  );
}
