import 'package:flutter/material.dart';

class YoutubeAppColors {
  static const rgb322933 = Color.fromARGB(255, 32, 29, 33);
  static const rgb221923 = Color.fromARGB(255, 22, 19, 23);
}

class YoutubeScreen extends StatelessWidget {
  const YoutubeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: const AppBarWidget(),
      body: ListView(children: [FeedWidget(), MoviesWidget()]),
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

class FeedContent {
  FeedContent(this.title, this.iconData, this.color);

  final String title;
  final IconData iconData;
  final Color color;
}

class MovieContent {
  MovieContent(this.thumbnailUrl, this.playTime, this.title,
      this.contributorName, this.contributorIconUrl, this.views, this.post);

  final String thumbnailUrl;
  final String playTime;
  final String title;
  final String contributorName;
  final String contributorIconUrl;
  final String views;
  final String post;
}

class MoviesWidget extends StatelessWidget {
  MoviesWidget({super.key});
  final movies = [
    MovieContent(
      'https://i.ytimg.com/vi/EnKi6Vtng8s/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDtkurujoau12W0SO7jUq2VT3lkFg',
      '19:24',
      '自称新マップに詳しい関優太を頼って教えを請いに来た釈迦【Escape from Tarkov】',
      '関優太',
      'https://yt3.ggpht.com/EMNuk9rI9qB1aDrRmqiLyQJDzIZd2XhHGgbDSKJ6SjiUSZJMTuvL-NF-_wXyMMg-Zv_x1AeiVA=s88-c-k-c0x00ffffff-no-rj',
      '9.6万',
      '1日前',
    ),
    MovieContent(
      'https://i.ytimg.com/vi/aWNPNEI80eQ/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCsn3UFNVmWisuFjkS9Tl7LitMeSA',
      '2:46',
      '関優太とのデュオ後、ソロタルコフに怯える釈迦',
      'SHAKAch',
      'https://yt3.ggpht.com/ytc/AMLnZu9F5Fb9jcgI3aM4E6WzpqKoGTaP9XXfZDA3LQ3p=s88-c-k-c0x00ffffff-no-rj',
      '3134',
      '19分前',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> contentList = [];

    // ヘッダーを追加
    contentList.add(_header());

    // サムネイル部、情報部を追加
    for (var movie in movies) {
      contentList.add(_movieThumbnail(movie.thumbnailUrl, movie.playTime));
      contentList.add(_information(movie.title, movie.contributorName,
          movie.contributorIconUrl, movie.views, movie.post));
    }

    return Column(children: contentList);
  }

  // ヘッダー
  Widget _header() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 16),
      color: YoutubeAppColors.rgb322933,
      height: 64,
      width: double.infinity,
      child: const Text(
        '急上昇動画',
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }

  // 動画サムネイル
  Widget _movieThumbnail(String thumbnailUrl, String playTime) {
    return Stack(alignment: Alignment.bottomRight, children: [
      SizedBox(
        height: 220.5,
        child: Image.network(thumbnailUrl,
            width: double.infinity, height: double.infinity),
      ),
      Container(
        padding: const EdgeInsets.only(right: 8, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(
              Icons.equalizer,
              size: 24,
              color: Colors.white,
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
              color: Colors.black87,
              child: Text(
                playTime,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      )
    ]);
  }

  // 動画情報
  Widget _information(String title, String contributorName,
      String contributorIconUrl, String views, String post) {
    return Container(
      color: YoutubeAppColors.rgb322933,
      height: 76,
      padding: const EdgeInsets.all(8),
      child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(contributorIconUrl),
                    fit: BoxFit.fill,
                  )),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      child: Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  )),
                  Text(
                    '$contributorName・$views回視聴・$post',
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  )
                ],
              ),
            ),
            const Icon(
              Icons.more_vert,
              color: Colors.white,
            )
          ]),
    );
  }
}
