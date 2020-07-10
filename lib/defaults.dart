import 'package:flutter/material.dart';

const secondaryColor = Color(0xfff17f29);
const thirdColor = Color(0xff65def1);
const textColor = Color(0xff121212);
const textLightColor = Color(0xffa1a1a1);

const defaultPadding = 16.0;

const defaultShadow = BoxShadow(
  offset: Offset(0, 4),
  blurRadius: 4,
  color: textColor,
);

final defaultDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(16.0)),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      spreadRadius: 2,
      blurRadius: 6,
      offset: Offset(0, 0), // changes position of shadow
    ),
  ],
);

final divider = Divider(
  color: Colors.transparent,
  height: defaultPadding,
);

final dividerFake = Divider(
  color: Colors.transparent,
  height: 0,
);
