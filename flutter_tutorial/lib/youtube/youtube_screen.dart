import 'package:flutter/material.dart';

class YoutubeScreen extends StatelessWidget {
  const YoutubeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: const AppBarWidget(),
          body: ListView(children: [FeedWidget()]),
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

class FeedWidget extends StatelessWidget {
  FeedWidget({super.key});

  final feedContents = [
    FeedContent(
        '急上昇', Icons.trending_up, const Color.fromARGB(255, 113, 12, 41)),
    FeedContent(
        '音楽', Icons.music_note, const Color.fromARGB(255, 43, 137, 116)),
    FeedContent('ゲーム', Icons.gamepad, const Color.fromARGB(255, 147, 91, 89)),
    FeedContent('ニュース', Icons.article, const Color.fromARGB(255, 15, 56, 109)),
    FeedContent('学び', Icons.lightbulb, const Color.fromARGB(255, 23, 105, 62)),
    FeedContent('ライブ', Icons.sensors, const Color.fromARGB(255, 217, 87, 41)),
    FeedContent(
        'スポーツ', Icons.emoji_events, const Color.fromARGB(255, 18, 99, 127)),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 3.5,
        padding:
            const EdgeInsets.only(left: 12, top: 16, right: 12, bottom: 16),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: feedContents
            .map((content) => Container(
                  decoration: BoxDecoration(
                      color: content.color,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Icon(content.iconData),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        content.title,
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ))
            .toList());
  }
}

class FeedContent {
  FeedContent(this.title, this.iconData, this.color);

  final String title;
  final IconData iconData;
  final Color color;
}
