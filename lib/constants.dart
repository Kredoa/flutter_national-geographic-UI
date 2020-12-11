import 'package:flutter/material.dart';

import 'components/list-card.dart';

const kPrimary_color = Color(0xffFBD52D);
const kPrimary_splash_color = Colors.orange;

List<Widget> animalsList = [
  Container(
    child: Center(
      child: Icon(
        Icons.more_horiz,
        size: 40.0,
      ),
    ),
  ),
  ListCard(
    image: AssetImage('images/elephant.jpg'),
    label: "Elephant",
  ),
  ListCard(
    image: AssetImage('images/tiger.jpg'),
    label: "Tiger",
  ),
  ListCard(
    image: AssetImage('images/lion1.jpg'),
    label: "Lion",
  ),
  ListCard(
    image: AssetImage('images/zebra.jpg'),
    label: "Zebra",
  ),
];
