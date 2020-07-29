import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soundselections/data/categories.dart';
import 'package:soundselections/screens/details/details_screen.dart';
import '../../../data/music.dart';
import '../../../defaults.dart';
import '../../details/details_screen.dart';

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

  ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height -
          MediaQuery.of(context).padding.top -
          MediaQuery.of(context).padding.bottom -
          184.0,
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
          return Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 12.0),
              ),
              Expanded(
                child: ListView.builder(
                  controller: _controller,
                  scrollDirection: Axis.vertical,
                  itemCount: 1,
                  itemBuilder: (context, temp) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding, vertical: defaultPadding),
                      child: Column(
                        children: <Widget>[
                          //New Picks section---------------------------------
                          header("Recently Added"),
                          Container(
                            height: 260.0,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.transparent,
                            child: Container(
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    child: Container(
                                      foregroundDecoration: new BoxDecoration(
                                        gradient: new LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.white.withOpacity(0.0),
                                            Colors.white.withOpacity(0.0),
                                            Colors.white
                                          ],
                                          stops: [0, .05, .95, 1],
                                        ),
                                      ),
                                      height: double.infinity,
                                      width: MediaQuery.of(context).size.width,
                                      child: CarouselSlider.builder(
                                        options: CarouselOptions(
                                          aspectRatio: 16 / 9,
                                          viewportFraction: 0.6,
                                          initialPage: 0,
                                          enableInfiniteScroll: true,
                                          reverse: false,
                                          autoPlay: true,
                                          autoPlayInterval:
                                              Duration(seconds: 5),
                                          autoPlayAnimationDuration:
                                              Duration(milliseconds: 1000),
                                          autoPlayCurve: Curves.easeInOut,
                                          enlargeCenterPage: true,
                                          scrollDirection: Axis.horizontal,
                                        ),
                                        itemCount: 5,
                                        itemBuilder: (context, index) {
                                          Key k = UniqueKey();
                                          List<Music> current = getAtIndex(i);
                                          Music m = current[
                                              current.length - index - 1];
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailsScreen(m, k)));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  new BoxShadow(
                                                    color: Colors.black26,
                                                    blurRadius: 4.0,
                                                    offset: Offset(0.0, 2),
                                                  ),
                                                ],
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0)),
                                              ),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8.0)),
                                                  child: Stack(
                                                    children: <Widget>[
                                                      Hero(
                                                        tag: k,
                                                        child: Image.asset(
                                                            "assets/images/" +
                                                                m.getAlbumImg),
                                                      ),
                                                      //Image.network(m.getAlbumImg),
                                                      Positioned(
                                                        bottom: 0.0,
                                                        left: 0.0,
                                                        right: 0.0,
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              colors: [
                                                                Color.fromARGB(
                                                                    200,
                                                                    0,
                                                                    0,
                                                                    0),
                                                                Color.fromARGB(
                                                                    0, 0, 0, 0)
                                                              ],
                                                              stops: [.4, 1],
                                                              begin: Alignment
                                                                  .bottomCenter,
                                                              end: Alignment
                                                                  .topCenter,
                                                            ),
                                                          ),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      10.0,
                                                                  horizontal:
                                                                      20.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              AutoSizeText(
                                                                m.getTitle,
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      thirdColor,
                                                                  fontSize:
                                                                      20.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                                maxLines: 1,
                                                              ),
                                                              AutoSizeText(
                                                                m.getArtist,
                                                                style:
                                                                    TextStyle(
                                                                  //color: Colors.grey[400],
                                                                  color: thirdColor
                                                                      .withAlpha(
                                                                          200),
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                                maxLines: 1,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: defaultPadding)),
                          //Featured section----------------------------------
                          header("Featured"),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.transparent,
                            child: Container(
                              padding: EdgeInsets.all(defaultPadding),
                              decoration: defaultDecoration,
                              child: Column(
                                children: <Widget>[
                                  ListView.separated(
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            divider,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: featured(getAtIndex(i)).length,
                                    itemBuilder: (context, j) {
                                      Music current =
                                          featured(getAtIndex(i))[j];
                                      Key k = UniqueKey();
                                      return songButton(
                                          context, k, current, 20, 16, 120);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: defaultPadding)),
                          //Other section----------------------------------
                          header("Other Selections"),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.transparent,
                            child: Container(
                              padding: EdgeInsets.all(defaultPadding),
                              decoration: defaultDecoration,
                              child: Column(
                                children: <Widget>[
                                  ListView.separated(
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            divider,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: getOtherAtIndex(i).length,
                                    itemBuilder: (context, j) {
                                      Music current = getOtherAtIndex(i)[j];
                                      Key k = UniqueKey();
                                      return songButton(
                                          context, k, current, 16, 14, 90);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

Widget songButton(BuildContext context, Key k, Music current, double largeSize,
    double smallSize, double albumSize) {
  return FlatButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
    splashColor: thirdColor.withAlpha(800),
    highlightColor: thirdColor.withAlpha(600),
    padding: EdgeInsets.all(0.0),
    onPressed: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => DetailsScreen(current, k)));
    },
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Colors.black26,
                blurRadius: 2.0,
                offset: Offset(0.0, 2),
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            child: Hero(
              tag: k,
              child: Image.asset(
                "assets/images/" + current.getAlbumImg,
                width: albumSize,
                height: albumSize,
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
        Flexible(
          child: Container(
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: AutoSizeText(
                      current.getTitle,
                      style: TextStyle(
                        fontSize: largeSize,
                        fontWeight: FontWeight.w500,
                        //color: thirdColor,
                        color: Color(0xff469ba8),
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: AutoSizeText(
                      current.getArtist,
                      style: TextStyle(
                        fontSize: smallSize,
                        fontWeight: FontWeight.w500,
                        color: thirdColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: AutoSizeText(
                      current.getAlbum,
                      style: TextStyle(
                        fontSize: smallSize,
                        fontWeight: FontWeight.w500,
                        color: thirdColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget header(String title) {
  return Column(
    children: <Widget>[
      Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
    ],
  );
}
