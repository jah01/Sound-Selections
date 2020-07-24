import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:soundselections/defaults.dart';
import '../../../data/categories.dart';
import 'body.dart';

// ignore: must_be_immutable
class CategoryList extends StatefulWidget {
  Selected selectedIndex;
  final Function topNavTapped;
  ItemScrollController itemScrollController;

  CategoryList(
      this.selectedIndex, this.topNavTapped, this.itemScrollController);

  @override
  _CategoryList createState() =>
      _CategoryList(selectedIndex, topNavTapped, itemScrollController);
}

class _CategoryList extends State<CategoryList> {
  Selected selectedIndex;
  final Function topNavTapped;
  ItemScrollController itemScrollController;

  _CategoryList(
      this.selectedIndex, this.topNavTapped, this.itemScrollController);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          height: 100,
          child: ScrollablePositionedList.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemScrollController: itemScrollController,
            itemBuilder: (context, i) {
              return Column(
                children: <Widget>[
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          topNavTapped(i);
                          itemScrollController.scrollTo(
                              index: i,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOutCubic);
                        });
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
                                  color: selectedIndex.getIndex == i
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
                              color: selectedIndex.getIndex == i
                                  ? thirdColor
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
          ),
        ),
      ],
    );
  }
}
