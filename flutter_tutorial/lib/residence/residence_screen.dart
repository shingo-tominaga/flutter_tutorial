import 'package:flutter/material.dart';

// Youtubeチュートリアルでは別クラスだったけど、画面単位で持ってる場合もアリかと思った
class ColorAssets {
  static const rgb75_159_144 = Color.fromARGB(255, 75, 159, 144);
  static const rgb229_235_234 = Color.fromARGB(255, 229, 235, 234);
}

class ResidenceScreen extends StatefulWidget {
  const ResidenceScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ResidenceScreenState();
}

class _ResidenceScreenState extends State<ResidenceScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(appBar: AppBarWidget()),
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
            padding: const EdgeInsets.only(
                left: 0,
                right: 8)), //ButtonStyle(padding: MaterialStateProperty.all()),
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
