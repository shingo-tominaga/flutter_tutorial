import 'package:flutter/material.dart';
import 'package:flutter_tutorial/youtube/youtube_app_colors.dart';
import 'package:flutter_tutorial/youtube/youtube_feed_widget.dart';
import 'package:flutter_tutorial/youtube/youtube_movies_widget.dart';

class YoutubeScreen extends StatefulWidget {
  const YoutubeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      if (index == 2) {
        _showBottomSheet();
      } else {
        _selectedIndex = index;
      }
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 400,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
                color: YoutubeAppColors.rgb322933,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                )),
            child: const Text(
              'showModalBottomSheet()を呼び出した',
              style: TextStyle(color: Colors.white),
            ),
          );
        });
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String label, IconData iconData, IconData activeIconData,
      {double? iconSize = 28}) {
    return BottomNavigationBarItem(
        backgroundColor: YoutubeAppColors.rgb322933,
        icon: Icon(iconData, size: iconSize),
        activeIcon: Icon(activeIconData, size: iconSize),
        label: label);
  }

  // BottomNavigationBarによる遷移確認用のWidget
  final Widget _homeScreen =
      ListView(children: [YoutubeFeedWidget(), YoutubeMoviesWidget()]);

  final Widget _searchScreen = Container(
    color: YoutubeAppColors.rgb221923,
    alignment: Alignment.center,
    child:
        const Text('検索画面', style: TextStyle(color: Colors.white, fontSize: 32)),
  );

  final Widget _subscriptionChannelsScreen = Container(
    color: YoutubeAppColors.rgb221923,
    alignment: Alignment.center,
    child: const Text('登録チャンネル画面',
        style: TextStyle(color: Colors.white, fontSize: 32)),
  );

  final Widget _libraryScreen = Container(
    color: YoutubeAppColors.rgb221923,
    alignment: Alignment.center,
    child: const Text('ライブラリ画面',
        style: TextStyle(color: Colors.white, fontSize: 32)),
  );

  List<Widget> _screens = [];

  @override
  void initState() {
    _screens = [
      _homeScreen,
      _searchScreen,
      Container(), // 真ん中のタブには画面割り振りがないため、ダミーとして。
      _subscriptionChannelsScreen,
      _libraryScreen
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: const AppBarWidget(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: YoutubeAppColors.rgb322933,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        unselectedFontSize: 10,
        selectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        items: [
          _bottomNavigationBarItem('ホーム', Icons.home_outlined, Icons.home),
          _bottomNavigationBarItem('検索', Icons.explore_outlined, Icons.explore),
          _bottomNavigationBarItem(
              '', Icons.add_circle_outline, Icons.add_circle_outline,
              iconSize: 40),
          _bottomNavigationBarItem(
              '登録チャンネル', Icons.subscriptions_outlined, Icons.subscriptions),
          _bottomNavigationBarItem(
              'ライブラリ', Icons.video_library_outlined, Icons.video_library)
        ],
      ),
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
