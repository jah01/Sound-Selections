import 'package:flutter/material.dart';
import 'package:soundselections/data/categories.dart';
import '../../defaults.dart';
import 'components/body.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    populateAll();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).padding.top + 40.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.menu),
            color: textColor,
            onPressed: () {},
          ),
          title: Text("Sound Selections", style: TextStyle(color: textColor),),
          centerTitle: true,
        ),
      ),
      body: Body(),
    );
  }
}
