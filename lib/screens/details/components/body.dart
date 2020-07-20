import 'package:flutter/material.dart';
import '../../details/details_screen.dart';
import '../../../data/music.dart';

class Body extends StatelessWidget {
  final Music song;
  final Key k;
  Body(this.song, this.k);

  //const Body({Key key, this.song}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Hero(
              tag: k,
              child: Image.asset("assets/images/" + song.getAlbumImg),
            ),
            Text("testing"),
          ],
        ),
      );
  }
}