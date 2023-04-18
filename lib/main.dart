import 'package:bubolechka2/data/categories.dart';
import 'package:bubolechka2/language_selector.dart';
import 'package:bubolechka2/models/bubo_category.dart';
import 'package:flutter/material.dart';

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

///
/// HomePage of the Bubolechka Application
///
/// Displays the available categories and language selection on the main screen.
///
class BuboHomePage extends StatefulWidget {
  const BuboHomePage({super.key});

  @override
  State<BuboHomePage> createState() => _BuboHomePageState();
}

class _BuboHomePageState extends State<BuboHomePage> {
  String _language = 'bg';

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
          Positioned(
            top: 30,
            bottom: 100,
            left: 20,
            right: 20,
            child: BuboCategoryViewer(_language),
          ),
          Positioned(
              right: 30,
              bottom: 30,
              width: 54,
              height: 300,
              child: LanguageSelector(onLanguageChange: (newLanguage) {
                setState(() {
                  _language = newLanguage.toLowerCase();
                });
              })),
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

///
/// Category view for the main screen
///
/// Gets all available categories and places them into a list view
///
///
class BuboCategoryViewer extends StatelessWidget {
  final String language;
  BuboCategoryViewer(this.language, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: buboCategories.map((buboCategory) {
        return BuboCategoryListItem(language, buboCategory);
      }).toList(),
    );
  }
}

///
/// Widget for displaying a category on the main screen
///
/// TODO: Модифицирайте този клас така, че да показва не само името на
///       категорията, но и нейната картинка.
///       Картинките за всяка категория могат да се вземат по следният начин:
///       Image.asset(category.image)
///
///
class BuboCategoryListItem extends StatelessWidget {
  final String language;
  final BuboCategory category;

  const BuboCategoryListItem(this.language, this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _viewWithContainer(),
      //_viewWithStack(),
    ]);
  }

  Widget _viewWithStack() {
    return Stack(
      children: [
        SizedBox(width: 250, height: 250, child: Image.asset(category.image)),
        Positioned(
            top: 190,
            left: 0,
            width: 250,
            child: Center(
                child: Text(
              category.translatedLabels[language] != null
                  ? category.translatedLabels[language]!
                  : 'Not available',
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ))),
      ],
    );
  }

  Widget _viewWithContainer() {
    return Container(
        width: 250,
        height: 250,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(category.image))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
          child: Center(
            child: Text(
              category.translatedLabels[language] != null
                  ? category.translatedLabels[language]!
                  : 'Not available',
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ));
  }
}
