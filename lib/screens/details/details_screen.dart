import 'package:flutter/material.dart';
import '../../data/music.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Music song;
  final Key k;
  DetailsScreen(this.song, this.k);

  //const DetailsScreen(Music m, {Key key, this.song}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(song, k),
    );
  }
}