import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soundselections/data/music.dart';
import 'package:soundselections/defaults.dart';
import '../../../data/categories.dart';

Color changeColor(int index) {
  if (index == 1) {
    return Color(0xffffff00);
  } else {
    return Color(0xffff00ff);
  }
}

class CategoryList extends StatefulWidget {
  @override
  _CategoryList createState() => _CategoryList();
}

class _CategoryList extends State<CategoryList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    ScrollController _controller = new ScrollController();

    void goToTop() {
//      _controller.jumpTo(0);
      _controller.animateTo((0),
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut);
    }

    Color c = changeColor(selectedIndex);
    //CustomColor c = new CustomColor(Color(0xffff00ff));
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, i) {
                return Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = i;
                            c = changeColor(selectedIndex);
                          });
                          goToTop();
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 50,
                              color: Colors.transparent,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  categories[i],
                                  style: TextStyle(
                                    color: selectedIndex == i
                                        ? textColor
                                        : textLightColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 6.0),
                            ),
                            Container(
                              height: 6,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: selectedIndex == i
                                    ? secondaryColor
                                    : Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            )),
//        Padding(
//          padding: EdgeInsets.only(top: 12.0),
//        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width -
              (MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom -
                  132.0),
          child: ListView.builder(
            controller: _controller,
            scrollDirection: Axis.vertical,
            itemCount: 1,
            itemBuilder: (context, i) {
              List<Music> current = getAtIndex(selectedIndex);
              print("COLOR: " + c.toString());
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
                child: Column(
                  children: <Widget>[
                    //New Picks section-----------------------------------------
                    Container(
                      height: 260.0,
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
                                "New Picks",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0)),
                            Expanded(
//                                  padding: EdgeInsets.symmetric(vertical: defaultPadding),
//                                  height: 200,
//                                  width: MediaQuery.of(context).size.width,
//                                  color: c,
                              child: Container(
                                height: double.infinity,
                                width: MediaQuery.of(context).size.width,
                                color: c,
                                //TODO in this container, show the latest 5 songs
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: defaultPadding * 1.5)),
                    //Featured section------------------------------------------
                    Container(
                      //height: 520.0,
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
                                "Featured",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: getAtIndex(selectedIndex).length,
                              itemBuilder: (context, j) {
                                return Image.network(getAtIndex(selectedIndex)[j].getAlbumImg, width: 100, height: 100,);
                                //return Image.asset();
                              }
                            )
                            //TODO add the featured albums here
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: defaultPadding * 1.5)),
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
  }
}
