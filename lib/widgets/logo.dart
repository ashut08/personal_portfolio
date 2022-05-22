import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 100,
      width: 100,
      child: Image.asset(
        "assets/darklogo.png",
        // color: Colors.transparent,
      ),
    );
  }
}

class LightLogo extends StatelessWidget {
  const LightLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 100,
      width: 100,
      child: Image.asset("assets/lightlogo.png"),
    );
  }
}
