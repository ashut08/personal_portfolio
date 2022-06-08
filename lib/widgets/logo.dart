import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage("assets/logo.png"))),
      // margin: const EdgeInsets.all(20),
      height: 70,
      width: 70,
      // child: Image.asset(
      //   "assets/logo.png",
      //   fit: BoxFit.cover,
      //   // color: Colors.transparent,
      // ),
    );
  }
}

class LightLogo extends StatelessWidget {
  const LightLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage("assets/logo.png"),
        ),
      ),
      // margin: const EdgeInsets.all(20),
      height: 70,
      width: 70,
      // child: Image.asset(
      //   "assets/logo.png",
      //   fit: BoxFit.cover,
      // ),
    );
  }
}
