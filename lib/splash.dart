import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/gen/assets.gen.dart';
import 'package:flutter_application_2/home.dart';
import 'package:flutter_application_2/onBoarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
    });
  }

  @override
  Widget build(Object context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
            child: Assets.img.background.splash.image(fit: BoxFit.cover)),
        Center(child: Assets.img.icons.logo.svg()),
      ]),
    );
  }
}
