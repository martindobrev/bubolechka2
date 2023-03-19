import 'package:flutter/material.dart';

///
/// This file demonstrates some basic flutter widgets
///

/// Simple text widget
var simpleText = const Text('HELLO WORLD', textDirection: TextDirection.ltr);

/// Styled text with some properties
/// Feel free to experiment with additional properties
var styledText = const Text(
  'Styled hello world',
  textDirection: TextDirection.ltr,
  style: TextStyle(color: Colors.green, fontSize: 30),
);

/// List of text elements
/// Will be used in Column and Row layouts
var listOfTextElements =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
        .split(' ')
        .map((word) => Text(
              word,
              textDirection: TextDirection.ltr,
            ))
        .toList();

/// Simple container widget
/// Try out different properties
var simpleContainer = Container(
  width: 100,
  height: 100,
  color: const Color.fromARGB(220, 26, 166, 231),
);

/// List of colors
var listOfColors = [
  Colors.black,
  Colors.green,
  Colors.blue,
  Colors.grey,
  const Color.fromARGB(49, 50, 50, 50),
];

/// List of color containers
/// Can be used as children elements for Column and Row elements
var listOfColorContainers = listOfColors.map((element) {
  return Container(width: 200, height: 50, color: element);
}).toList();

var columnOfTextWidgets = Column(
  children: listOfTextElements,
);

var columnOfContainers = Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: listOfColorContainers,
);

var row = Row(textDirection: TextDirection.ltr, children: listOfTextElements);

/// Stack element
/// position some elements on top of each other
var stack = Stack(
  textDirection: TextDirection.ltr,
  children: [
    Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fog.jpg'), fit: BoxFit.cover)),
      child: null,
    ),
    Positioned(
      top: 20,
      left: 50,
      child: Container(color: Colors.grey, child: columnOfTextWidgets),
    ),
    Positioned(
      bottom: 50,
      right: 50,
      child: Container(
        color: const Color.fromARGB(174, 0, 0, 0),
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Icon(
            Icons.settings,
            size: 50,
            color: Colors.white,
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
    ),
    Center(
      child: Container(
        color: Colors.white,
        child: const Padding(
          padding: EdgeInsets.all(50.0),
          child: Text(
            'WELCOME',
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 60),
          ),
        ),
      ),
    )
  ],
);
