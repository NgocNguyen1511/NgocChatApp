import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utilities/assets_manager.dart';
import '../chats_list/chats_list_screen.dart';
import '../groups/groups_screen.dart';
import '../people/people_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  final List<Widget> pages = [
    ChatsListScreen(),
    GroupsScreen(),
    PeopleScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Chat Pro'),
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(AssetsManager.userImage),
          )
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.group),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.globe),
            label: 'People',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          pageController.animateToPage(index,
              duration: Duration(microseconds: 300), curve: Curves.easeIn);
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
