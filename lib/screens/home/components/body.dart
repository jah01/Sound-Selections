import 'dart:async';

import 'package:flutter/material.dart';
import 'package:soundselections/data/categories.dart';
import 'package:soundselections/defaults.dart';
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


  Selected selectedIndex = new Selected(0);
  PageController pageController;

  @override
  void initState() {
    super.initState();
    selectedIndex.setIndex(0);
    pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void topNavTapped(int i) {

    isPressed = true;
    pageController.animateToPage(i,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
    selectedIndex.setIndex(i);
//    Timer(Duration(milliseconds: 500), () {
//
//    });
//    _timer = new Timer(const Duration(milliseconds: 500), () {
//      setState(() {
//        selectedIndex.setIndex(i);
//      });
//    });
//    setState(() {
//      //this.selectedIndex = i;
//      pageController.animateToPage(i,
//          duration: Duration(milliseconds: 500), curve: Curves.ease);
//      //pageController.jumpToPage(i);
//      //selectedIndex.setIndex(i);
////      _timer = new Timer(const Duration(milliseconds: 500), () {
////        setState(() {
////          selectedIndex.setIndex(i);
////        });
////      });
//    });



    //return _selectedIndex;

    //c = changeColor(_selectedIndex);
  }

  void updateUnderline(int i) {
//    setState(() {
//      //this.selectedIndex = i;
//      selectedIndex.setIndex(i);
//    });

  if (isPressed) {
    selectedIndex.setIndex(i);
  } else {
    setState(() {
      selectedIndex.setIndex(i);
    });
  }
  new Timer(const Duration(milliseconds: 500), () {
    isPressed = false;
    });

//  Timer(const Duration(milliseconds: 300), () {
//      setState(() {
//        selectedIndex.setIndex(i);
//      });


//    _timer = new Timer(const Duration(milliseconds: 300), () {
//      setState(() {
//        selectedIndex.setIndex(i);
//      });
//    });
//    setState(() {
//      setSI(i);
//    });
//    setState(() {
//      //
//      //changeIndex(i);
//    });
  //topNavTapped(i);
//    this._selectedIndex = i;
  print(selectedIndex);
  }

//  int changeIndex(int i) {
//    this._selectedIndex = i;
//  }
//
//  void setSI(int i) {
//    this._selectedIndex = i;
//  }
//
//  int getSI() {
//    return _selectedIndex;
//  }

  @override
  Widget build(BuildContext context) {
    print(selectedIndex);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CategoryList(selectedIndex, topNavTapped),
          SongList(pageController, updateUnderline),
        ],
      ),
    );
  }
}