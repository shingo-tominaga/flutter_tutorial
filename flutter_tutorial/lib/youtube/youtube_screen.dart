import 'package:flutter/material.dart';

class YoutubeScreen extends StatelessWidget {
  const YoutubeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    );
  }
}

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _youtubeButton(),
      title: const Text('YouTube'),
      titleSpacing: 0,
      actions: [
        _actionButton(() {}, const Icon(Icons.cast)),
        _actionButton(() {}, const Icon(Icons.notifications_none_outlined)),
        _actionButton(() {}, const Icon(Icons.search)),
        _googleAccountButton(),
        const SizedBox(
          width: 4,
        )
      ],
    );
  }

  IconButton _youtubeButton() {
    return IconButton(
        padding: const EdgeInsets.only(left: 4),
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
