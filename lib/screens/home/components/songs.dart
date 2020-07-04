import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:soundselections/data/categories.dart';
import '../../../data/music.dart';
import '../../../defaults.dart';
import 'categories.dart';

class SongList extends StatefulWidget {
  final scroll;
  final Function updateUnderline;
  SongList(this.scroll, this.updateUnderline);

  @override
  _SongList createState() => _SongList(scroll, updateUnderline);
}

class _SongList extends State<SongList> {

  final scroll;
  final Function updateUnderline;
  _SongList(this.scroll, this.updateUnderline);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 500,
        child: PageView.builder(
          onPageChanged: (i) {
            setState(() {
              updateUnderline(i);
            });
          },
          controller: scroll,
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, i) {
            return Container(
              width: 30,
              height: 80,
              color: Colors.grey,
            );
          },
        ),
    );
  }
}
