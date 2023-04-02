import 'package:bubolechka2/language_selection.dart';
import 'package:flutter/material.dart';

import 'flutter_basics/material_widgets.dart';
//import 'flutter_basics/cupertino_widgets.dart';

void main() {
  runApp(const BuboApp());
}

class BuboApp extends StatelessWidget {
  const BuboApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bubolechka 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BuboHomePage(),
    );
  }
}

class BuboHomePage extends StatelessWidget {
  const BuboHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/main_background.png'),
                    fit: BoxFit.cover)),
            child: null,
          ),
          const Positioned(
              right: 30,
              bottom: 30,
              width: 54,
              height: 300,
              child: LanguageSelector()),
          Positioned(
            bottom: 30,
            left: 30,
            width: 200,
            child: Image.asset('assets/bubo_logo.png'),
          ),
        ],
      ),
    );
  }
}
