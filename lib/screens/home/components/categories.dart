import 'package:flutter/material.dart';
import 'package:soundselections/defaults.dart';
import '../../../data/categories.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryList createState() => _CategoryList();
}

class _CategoryList extends State<CategoryList> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: defaultPadding * 1.5),
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, i) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = i;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      categories[i],
                      style: TextStyle(
                        color: selectedIndex == i ? textColor : textLightColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(margin: EdgeInsets.symmetric(vertical: defaultPadding / 2),),
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
            );
          },
      )
    );
  }
}