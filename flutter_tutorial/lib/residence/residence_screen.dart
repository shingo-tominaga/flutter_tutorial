import 'package:flutter/material.dart';

// Youtubeチュートリアルでは別クラスに分けたけど、画面単位で持ってるパターンもアリかと思った
class ColorAssets {
  static const rgb75_159_144 = Color.fromARGB(255, 75, 159, 144);
  static const rgb229_235_234 = Color.fromARGB(255, 229, 235, 234);
  static const rgb228_99_79 = Color.fromARGB(255, 228, 99, 79);
  static const rgb249_246_242 = Color.fromARGB(255, 249, 246, 242);
}

class ResidenceScreen extends StatefulWidget {
  const ResidenceScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ResidenceScreenState();
}

class _ResidenceScreenState extends State<ResidenceScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const AppBarWidget(),
        body: ListView(
          children: [_SearchConditionCard()],
        ),
      ),
    );
  }
}

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<StatefulWidget> createState() => _AppBarWidgetStaet();
}

class _AppBarWidgetStaet extends State<AppBarWidget> {
  int _selectedChipIndex = 0;

  TextButton _buildChipButton(int chipIndex, String label) {
    Color? backgroundColor;
    Color? labelColor;
    FontWeight? fontWeight;

    if (chipIndex == _selectedChipIndex) {
      backgroundColor = ColorAssets.rgb229_235_234;
      labelColor = ColorAssets.rgb75_159_144;
      fontWeight = FontWeight.bold;
    } else {
      backgroundColor = null;
      labelColor = null;
      fontWeight = null;
    }

    void onChipTapped(int chipIndex) {
      setState(() {
        _selectedChipIndex = chipIndex;
      });
    }

    return TextButton(
        onPressed: () => onChipTapped(chipIndex),
        style: TextButton.styleFrom(
            padding: const EdgeInsets.only(left: 0, right: 8)),
        child: Chip(
          backgroundColor: backgroundColor,
          label: Text(label),
          labelStyle: TextStyle(color: labelColor, fontWeight: fontWeight),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: null,
      title: Row(
        children: [
          _buildChipButton(0, 'おすすめ'),
          _buildChipButton(1, 'リフォーム'),
        ],
      ),
      actions: const [
        IconButton(
            onPressed: null,
            padding: EdgeInsets.only(right: 8),
            icon: Icon(
              Icons.add_circle,
              color: ColorAssets.rgb75_159_144,
              size: 40,
            )),
      ],
    );
  }
}

class _SearchConditionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              const Text(
                'カウルのおすすめ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 12,
              ),
              const Expanded(
                  child: Text(
                '新着3件',
                style: TextStyle(
                    color: ColorAssets.rgb228_99_79,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              )),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: const [
                    Text(
                      '編集',
                      style: TextStyle(color: ColorAssets.rgb75_159_144),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.edit,
                      color: ColorAssets.rgb75_159_144,
                      size: 32,
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: ColorAssets.rgb249_246_242,
                borderRadius: BorderRadius.circular(4)),
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.train,
                      color: Colors.black54,
                      size: 18,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: Text(
                      '東京駅・品川駅・川崎駅・横浜駅・目黒駅・恵比寿駅・渋谷駅・新宿駅',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ))
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 2,
                    ),
                    // 本来はアイコン作ってもらったのを使うのでこういう調整とかはいらない
                    Container(
                      width: 14,
                      height: 14,
                      decoration: const BoxDecoration(
                          color: Colors.black54, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.currency_yen,
                        color: Colors.white,
                        size: 8,
                      ),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    const Text(
                      '下限なし 〜 2,000万円',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.info_outline,
                      color: Colors.black54,
                      size: 18,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      '1R 〜 4LDK / 10㎡以上 / 徒歩20分',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
