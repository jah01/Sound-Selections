import 'package:flutter/material.dart';
import '../../details/details_screen.dart';
import '../../../data/music.dart';

class Body extends StatelessWidget {
  final Music song;
  Body(this.song);

  //const Body({Key key, this.song}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Align(
        child: Text(song.getTitle),
      ),
    );
  }
}