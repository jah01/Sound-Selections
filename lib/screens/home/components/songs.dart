import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:soundselections/data/categories.dart';
import '../../../data/music.dart';
import '../../../defaults.dart';

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
      height: MediaQuery.of(context).size.width -
          (MediaQuery.of(context).padding.top -
              MediaQuery.of(context).padding.bottom -
              132.0),
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
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "New Picks",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                              padding:
                              EdgeInsets.symmetric(vertical: 8.0)),
                          Container(
                            height: 260.0,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.transparent,
                            child: Container(
                              //padding: EdgeInsets.all(defaultPadding),
                              //decoration: defaultDecoration,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    child: Container(
                                      foregroundDecoration: new BoxDecoration(
                                        color: Colors.purple,
                                        gradient: new LinearGradient(
                                          colors: [Colors.white, Colors.white.withOpacity(0.0), Colors.white.withOpacity(0.0), Colors.white],
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
                                          return Container(
                                            //margin: EdgeInsets.all(5.0),
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0)),
                                                child: Stack(
                                                  children: <Widget>[
                                                    Image.network("https://upload.wikimedia.org/wikipedia/en/1/11/Chance10Day.jpeg"),
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
                                                                  200, 0, 0, 0),
                                                              Color.fromARGB(
                                                                  0, 0, 0, 0)
                                                            ],
                                                            begin: Alignment
                                                                .bottomCenter,
                                                            end: Alignment
                                                                .topCenter,
                                                          ),
                                                        ),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 10.0,
                                                                horizontal:
                                                                    20.0),
                                                        child: Text(
                                                          'No. $index image',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          );
                                        },
                                      ),
                                      //TODO in this container, show the latest 5 songs
                                    ),
                                  ),
//                                  Container(
//                                    child: Container(
//                                    decoration: new BoxDecoration(
//                                      color: Colors.purple,
//                                      gradient: new LinearGradient(
//                                        colors: [Colors.white, Colors.white.withOpacity(0.0), Colors.white.withOpacity(0.0), Colors.white],
//                                        stops: [0, .05, .95, 1],
//                                      ),
//                                    ),
//                                    ),
//                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: defaultPadding)),
                          //Featured section----------------------------------
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Featured",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 8.0),),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.transparent,
                            child: Container(
                              padding: EdgeInsets.all(defaultPadding),
                              decoration: defaultDecoration,
                              child: Column(
                                children: <Widget>[
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: featured(getAtIndex(i)).length,
                                      itemBuilder: (context, j) {
                                        Music current = getAtIndex(i)[j];
                                        return Row(
                                            children: <Widget>[
                                              Image.network(
                                                current.getAlbumImg,
                                                width: 120,
                                                height: 120,
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 8.0)),
                                              Container(
                                                height: 120,
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text(
                                                        current.getTitle +
                                                            "\n" +
                                                            current.getArtist +
                                                            "\n" +
                                                            current.getAlbum,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                      })
                                ],
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: defaultPadding * 1.5)),
                          //Other section
                          Container(
                            height: 1040.0,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.transparent,
                            child: Container(
                              padding: EdgeInsets.all(defaultPadding),
                              decoration: defaultDecoration,
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Other Selections",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  //TODO add all other songs here
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
