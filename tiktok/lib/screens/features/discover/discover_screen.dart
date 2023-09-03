import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/gaps.dart';

import '../../../constants/sizes.dart';

const tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textEditingController =
      TextEditingController(text: 'default');

  late final TabController _tabController = TabController(
    length: tabs.length,
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    _tabController.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    FocusScope.of(context).unfocus();
  }

  void _onChanged(String value) {}

  void _onSubmitted(String value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: CupertinoSearchTextField(
          controller: _textEditingController,
          onChanged: _onChanged,
          onSubmitted: _onSubmitted,
        ),
        bottom: TabBar(
          controller: _tabController,
          splashFactory: NoSplash.splashFactory,
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
          isScrollable: true,
          labelColor: Colors.black,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: Sizes.size16,
          ),
          unselectedLabelColor: Colors.grey.shade500,
          indicatorColor: Colors.black,
          indicatorWeight: 1,
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.grey.shade500,
          tabs: [
            for (var tab in tabs) Tab(text: tab),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          GridView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: 50,
            padding: const EdgeInsets.all(Sizes.size6),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: Sizes.size5,
              mainAxisSpacing: Sizes.size5,
              childAspectRatio: 9 / (16 + 4),
            ),
            itemBuilder: (context, index) => Column(
              children: [
                AspectRatio(
                  aspectRatio: 9 / 16,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.size4)),
                    clipBehavior: Clip.hardEdge,
                    child: FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      placeholder: 'assets/images/image4.JPG',
                      image:
                          "https://postfiles.pstatic.net/MjAyMzA4MjdfNzQg/MDAxNjkzMTQxODY5OTE5.3ELA2bBa9bcGOtQOehinjDhgvderI1l_E225Qv1TGu0g.fUzSKhUj0p5e9jUODP8s193fwFH-yTyq05wJQDVcFeEg.JPEG.simya0528/IMG_6807.JPG?type=w580",
                    ),
                  ),
                ),
                Gaps.v3,
                const Text(
                  "This is a very long caption for my tiktok that i'm upload just now currently.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gaps.v3,
                DefaultTextStyle(
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.size12,
                    color: Colors.grey.shade500,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: Sizes.size12,
                        backgroundImage: NetworkImage(
                            'https://cdn.newspenguin.com/news/photo/202010/3276_9692_1455.jpg'),
                      ),
                      Gaps.h6,
                      const Expanded(
                        child: Text(
                          'Avatar description is very long',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Gaps.h2,
                      Icon(
                        FontAwesomeIcons.heart,
                        size: Sizes.size12,
                        color: Colors.grey.shade500,
                      ),
                      Gaps.h2,
                      const Text('2.0M')
                    ],
                  ),
                )
              ],
            ),
          ),
          for (var tab in tabs.skip(1))
            Center(
              child: Text(tab),
            ),
        ],
      ),
    );
  }
}
