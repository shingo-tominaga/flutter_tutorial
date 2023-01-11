import 'package:flutter/material.dart';
import 'package:flutter_tutorial/youtube/youtube_app_colors.dart';

class _FeedContent {
  _FeedContent(this.title, this.iconData, this.color);

  final String title;
  final IconData iconData;
  final Color color;
}

class YoutubeFeedWidget extends StatelessWidget {
  YoutubeFeedWidget({super.key});

  final feedContents = [
    _FeedContent(
        '急上昇', Icons.trending_up, const Color.fromARGB(255, 113, 12, 41)),
    _FeedContent(
        '音楽', Icons.music_note, const Color.fromARGB(255, 43, 137, 116)),
    _FeedContent('ゲーム', Icons.gamepad, const Color.fromARGB(255, 147, 91, 89)),
    _FeedContent('ニュース', Icons.article, const Color.fromARGB(255, 15, 56, 109)),
    _FeedContent('学び', Icons.lightbulb, const Color.fromARGB(255, 23, 105, 62)),
    _FeedContent('ライブ', Icons.sensors, const Color.fromARGB(255, 217, 87, 41)),
    _FeedContent(
        'スポーツ', Icons.emoji_events, const Color.fromARGB(255, 18, 99, 127)),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: YoutubeAppColors.rgb221923,
      child: GridView.count(
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
                        Icon(
                          content.iconData,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          content.title,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        )
                      ],
                    ),
                  ))
              .toList()),
    );
  }
}
