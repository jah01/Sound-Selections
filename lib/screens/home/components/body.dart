import 'package:flutter/material.dart';
import 'package:soundselections/data/categories.dart';
import 'package:soundselections/defaults.dart';
import 'categories.dart';
import 'songs.dart';

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
    setState(() {
      //this.selectedIndex = i;
      selectedIndex.setIndex(i);
      this.pageController.animateToPage(i,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    });

    //return _selectedIndex;

    //c = changeColor(_selectedIndex);
  }

  void updateUnderline(int i) {
    setState(() {
      //this.selectedIndex = i;
      selectedIndex.setIndex(i);
    });
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