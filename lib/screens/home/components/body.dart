import 'package:flutter/material.dart';
import 'package:soundselections/data/categories.dart';
import 'categories.dart';
import 'songs.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    populateAll();
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