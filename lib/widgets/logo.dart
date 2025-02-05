import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage("assets/newicon/logo.webp"),
              fit: BoxFit.cover)),
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
  const LightLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: AssetImage("assets/newicon/logo.webp"), fit: BoxFit.cover),
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
