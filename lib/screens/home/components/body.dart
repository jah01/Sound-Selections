import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'categories.dart';
import 'songs.dart';

bool isPressed = false;

class Selected {
  int selectedIndex;

  Selected(this.selectedIndex);

  int get getIndex {
    return selectedIndex;
  }

  void setIndex(int i) {
    selectedIndex = i;
  }
}

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _Body createState() => new _Body();
}

class _Body extends State<Body> {
  ItemScrollController itemScrollController;
  Selected selectedIndex = new Selected(0);
  PageController pageController;

  @override
  void initState() {
    super.initState();
    selectedIndex.setIndex(0);
    pageController = new PageController();
    itemScrollController = new ItemScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void topNavTapped(int i) {
    isPressed = true;
    int ms = 500 + (50 * (selectedIndex.getIndex - i).abs());
    pageController.animateToPage(i,
        duration: Duration(milliseconds: ms), curve: Curves.fastOutSlowIn);
    selectedIndex.setIndex(i);
  }

  void updateUnderline(int i) {
    if (isPressed) {
      selectedIndex.setIndex(i);
    } else {
      setState(() {
        itemScrollController.scrollTo(
            index: i,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic);
        selectedIndex.setIndex(i);
      });
    }

    new Timer(const Duration(milliseconds: 500), () {
      isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(selectedIndex);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CategoryList(selectedIndex, topNavTapped, itemScrollController),
          SongList(pageController, updateUnderline),
        ],
      ),
    );
  }
}
