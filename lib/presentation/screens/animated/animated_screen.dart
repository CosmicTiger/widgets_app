import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape() {
    /// NOTE: Here we are using specific and special libraries on Dart that helps out to do several stuff
    /// from the UI logic, which is from math.dart library.
    final random = Random();

    width = random.nextInt(300) + 120;
    height = random.nextInt(300) + 120;

    borderRadius = random.nextInt(100) + 20;

    color = Color.fromRGBO(
      random.nextInt(255),

      /// R
      random.nextInt(255),

      /// G
      random.nextInt(255),

      /// B
      1,

      /// Opacity
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          height: height <= 0 ? 0 : height,
          width: width <= 0 ? 0 : width,
          decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
