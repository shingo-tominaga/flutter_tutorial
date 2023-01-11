import 'package:flutter/material.dart';
import 'package:flutter_tutorial/youtube/youtube_app_colors.dart';
import 'package:flutter_tutorial/youtube/youtube_feed_widget.dart';
import 'package:flutter_tutorial/youtube/youtube_movies_widget.dart';

class YoutubeScreen extends StatelessWidget {
  const YoutubeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: const AppBarWidget(),
      body: ListView(children: [YoutubeFeedWidget(), YoutubeMoviesWidget()]),
    ));
  }
}

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: YoutubeAppColors.rgb322933,
      leading: _youtubeButton(),
      title: const Text('YouTube'),
      titleSpacing: 0,
      actions: [
        _actionButton(() {}, const Icon(Icons.cast)),
        _actionButton(() {}, const Icon(Icons.notifications_none_outlined)),
        _actionButton(() {}, const Icon(Icons.search)),
        _googleAccountButton(),
        const SizedBox(
          width: 8,
        )
      ],
    );
  }

  IconButton _youtubeButton() {
    return IconButton(
        padding: const EdgeInsets.only(left: 8),
        icon: Image.asset(
          'images/youtube_social_icon_red.png',
          height: 22,
        ),
        onPressed: () {});
  }

  IconButton _actionButton(Function() onPressed, Icon icon) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      iconSize: 28,
    );
  }

  TextButton _googleAccountButton() {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          minimumSize: const Size(36, 36),
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          shape: const CircleBorder()),
      child: const Text('S'),
    );
  }
}
