import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 300,
        width: 300,
        child: const FlutterLogo(),
      ),
    );
  }
}
