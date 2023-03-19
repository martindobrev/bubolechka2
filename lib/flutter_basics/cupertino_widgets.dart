import 'package:flutter/cupertino.dart';

///
/// This file demonstrates some basic flutter widgets
///

var simpleText = const Text('HELLO WORLD', textDirection: TextDirection.ltr);

var styledText = const Text(
  'Styled hello world',
  textDirection: TextDirection.ltr,
  style: TextStyle(color: CupertinoColors.activeGreen, fontSize: 30),
);

var listOfTextElements =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
        .split(' ')
        .map((word) => Text(
              word,
              textDirection: TextDirection.ltr,
            ))
        .toList();

var simpleContainer = Container(
  width: 100,
  height: 100,
  color: const Color.fromARGB(220, 26, 166, 231),
);

var listOfColors = [
  CupertinoColors.darkBackgroundGray,
  CupertinoColors.activeGreen,
  CupertinoColors.activeBlue,
  CupertinoColors.activeOrange,
  const Color.fromARGB(198, 224, 43, 121),
];

var listOfColorContainers = listOfColors.map((element) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(width: 200, height: 50, color: element),
  );
}).toList();

var columnOfTextWidgets = Column(
  children: listOfTextElements,
);

var columnOfContainers = Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [...listOfColorContainers, button],
);

var row = Row(children: listOfTextElements, textDirection: TextDirection.ltr);

var button = CupertinoButton.filled(
    child: Text('press me', textDirection: TextDirection.ltr),
    onPressed: () => print('button pressed!'));
