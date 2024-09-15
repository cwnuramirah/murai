import 'package:flutter/material.dart';
import 'package:frontend/message_page.dart';
import 'package:frontend/people_page.dart';
import 'package:frontend/stream_page.dart';
import 'package:frontend/theme.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;
  final List<Map<String, dynamic>> _pages = [
    {
      "label": "Stream",
      "icon": Icons.home,
    },
    {
      "label": "People",
      "icon": Icons.people,
    },
    {
      "label": "Chat",
      "icon": Icons.chat_bubble_rounded,
    },
  ];
  @override
  void initState() {
    // `this` with SingleTickerProviderStateMixin
    _controller = TabController(length: _pages.length, vsync: this);
    super.initState();
  }

  List<Tab> getTabBarItems() {
    List<Tab> tabbarItems = [];

    for (var i = 0; i < _pages.length; i++) {
      tabbarItems.add(Tab(
        icon: Icon(_pages[i]["icon"]),
        iconMargin: const EdgeInsets.only(bottom: StyledSize.xs),
        text: _pages[i]["label"],
        height: kBottomNavigationBarHeight,
      ));
    }

    return tabbarItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        children: const [
          StreamPage(),
          PeoplePage(),
          MessagePage(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: StyledColor.white,
          border: Border(
            top: BorderSide(color: StyledColor.grey, width: 1.0)
          ),
        ),
        child: TabBar(
          tabs: getTabBarItems(),
          controller: _controller,
          labelColor: StyledColor.black,
          unselectedLabelColor: StyledColor.greyDark,
          labelStyle: const TextStyle(fontSize: 11.0, fontFamily: 'Inter'),
          physics: const NeverScrollableScrollPhysics(),
          indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(
                color: StyledColor.black,
                width: 2.0,
              ),
              insets: EdgeInsets.only(bottom: kBottomNavigationBarHeight)),
        ),
      ),
    );
  }
}
