import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/screens/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok/screens/features/main_navigation/widgets/post_video_button.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';
import '../videos/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  // final screens = [
  //   StfScreen(key: GlobalKey()),
  //   StfScreen(key: GlobalKey()),
  //   Container(),
  //   StfScreen(key: GlobalKey()),
  //   StfScreen(key: GlobalKey()),
  // ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Record video')),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Offstage(
          offstage: _selectedIndex != 0,
          child: const VideoTimelineScreen(),
        ),
        Offstage(
          offstage: _selectedIndex != 1,
          child: Container(),
        ),
        Offstage(
          offstage: _selectedIndex != 3,
          child: Container(),
        ),
        Offstage(
          offstage: _selectedIndex != 4,
          child: Container(),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavTab(
                text: "Home",
                isSeleted: _selectedIndex == 0,
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                onTap: () => _onTap(0),
              ),
              NavTab(
                text: "Discover",
                isSeleted: _selectedIndex == 1,
                icon: FontAwesomeIcons.compass,
                selectedIcon: FontAwesomeIcons.solidCompass,
                onTap: () => _onTap(1),
              ),
              Gaps.h24,
              GestureDetector(
                onTap: _onPostVideoButtonTap,
                child: const PostVideoButton(),
              ),
              Gaps.h24,
              NavTab(
                text: "Inbox",
                isSeleted: _selectedIndex == 3,
                icon: FontAwesomeIcons.message,
                selectedIcon: FontAwesomeIcons.solidMessage,
                onTap: () => _onTap(3),
              ),
              NavTab(
                text: "Profile",
                isSeleted: _selectedIndex == 4,
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
