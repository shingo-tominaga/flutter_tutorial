import 'package:flutter/material.dart';
import 'package:flutter_tutorial/building/building_layout_screen.dart';
import 'package:flutter_tutorial/animation/animation_screen.dart';
import 'package:flutter_tutorial/youtube/youtube_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial Home',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Tutorial Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            TransitionScreenButton('Turorial1', BuildingLayoutScreen()),
            TransitionScreenButton('Turorial1.1', AnimationScreen()),
            TransitionScreenButton('Youtube', YoutubeScreen())
          ],
        ),
      ),
    );
  }
}

class TransitionScreenButton extends StatelessWidget {
  const TransitionScreenButton(this.text, this.newScreen, {super.key});
  final String text;
  final Widget newScreen;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => newScreen));
        },
        child: Text(text));
  }
}
