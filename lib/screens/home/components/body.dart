import 'package:flutter/material.dart';
import 'categories.dart';
import 'songs.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CategoryList(),
          //SongList(),
        ],
      ),
    );
  }
}