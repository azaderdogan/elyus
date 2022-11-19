import 'package:chat_new/screens/explore_screen.dart';
import 'package:chat_new/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  static int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
          print(_selectedIndex.toString());
        });
      },
      elevation: 0, // to get rid of the shadow

      backgroundColor: Colors
          .transparent, // transparent, you could use 0x44aaaaff to make it slightly less transparent with a blue hue.
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
      selectedItemColor: Color.fromARGB(255, 7, 255, 255),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '',
        ),
      ],
    );
  }
}
