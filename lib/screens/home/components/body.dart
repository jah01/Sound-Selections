import 'package:flutter/material.dart';
import 'package:soundselections/data/categories.dart';
import 'categories.dart';
import 'songs.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _Body createState() => new _Body();
}

class _Body extends State<Body> {

  int _selectedIndex;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  int topNavTapped(int i) {
    this._selectedIndex = i;
    return _selectedIndex;
    //c = changeColor(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    populateAll();
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CategoryList(topNavTapped),
          SongList(),
        ],
      ),
    );
  }
}