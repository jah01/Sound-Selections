import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
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
    Color c = changeColor(selectedIndex);
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
                      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = i;
                            c = changeColor(selectedIndex);
                            print(c.toString());
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
                                    color: selectedIndex == i ? textColor : textLightColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),),
                              ),
                            ),
                            Container(margin: EdgeInsets.symmetric(vertical: 6.0),),
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
            )
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.top + 140.0),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 1,
            itemBuilder: (context, i) {
              print("COLOR: " + c.toString());
              return Container(
                height: 50,
                width: 50,
                color: c,
              );
            },
          ),
        )
      ],
    );
  }
}
