import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late RiveAnimationController _controller;

  Future<void> _loadRiveFile() async {
    // Load the Rive file
    final data = await rootBundle.load('assets/splash_animation.riv');
    final file = RiveFile.import(data);

    // Extract the animation
    final animation = file.mainArtboard.animationByName('Animation');

    // Create and initialize the animation controller
    _controller = SimpleAnimation("animation", autoplay: true);
    setState(() {});
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => widget.child!),
          (route) => false);
    });
    super.initState();
    _loadRiveFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Positioned(child: BackdropFilter(filter: ImageFilter.blur())),
        RiveAnimation.asset(
          'assets/RiveAssets/jogging.riv',
        ),
      ]),
    );
  }
}
