import 'package:flutter/material.dart';
import 'package:flutter_tutorial/youtube/youtube_app_colors.dart';

class _MovieContent {
  _MovieContent(this.thumbnailUrl, this.playTime, this.title,
      this.contributorName, this.contributorIconUrl, this.views, this.post);

  final String thumbnailUrl;
  final String playTime;
  final String title;
  final String contributorName;
  final String contributorIconUrl;
  final String views;
  final String post;
}

class YoutubeMoviesWidget extends StatelessWidget {
  YoutubeMoviesWidget({super.key});

  final movieContents = [
    _MovieContent(
      'https://i.ytimg.com/vi/EnKi6Vtng8s/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDtkurujoau12W0SO7jUq2VT3lkFg',
      '19:24',
      '自称新マップに詳しい関優太を頼って教えを請いに来た釈迦【Escape from Tarkov】',
      '関優太',
      'https://yt3.ggpht.com/EMNuk9rI9qB1aDrRmqiLyQJDzIZd2XhHGgbDSKJ6SjiUSZJMTuvL-NF-_wXyMMg-Zv_x1AeiVA=s88-c-k-c0x00ffffff-no-rj',
      '9.6万',
      '1日前',
    ),
    _MovieContent(
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
    for (var movie in movieContents) {
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
