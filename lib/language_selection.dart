import 'package:flutter/material.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  var _selectionIsOpen = false;
  var _selectedLanguage = 'BG';
  late Widget _selectedWidget;
  final _languages = ['DE', 'EN', 'BG'];

  _LanguageSelectorState() {
    _selectedWidget = _getWidgetForLanguage('BG');
  }

  @override
  Widget build(BuildContext context) {
    print('SELECTION STATE $_selectionIsOpen');

    List<Widget> selectionWidgets = [];
    for (int i = 0; i < _languages.length; i++) {
      selectionWidgets
          .add(__getAnimatedWidgetForLanguage(_languages[i], i + 1));
    }

    return Stack(
      children: [
        ...selectionWidgets,
        _getControlWidget(),
      ],
    );
  }

  Widget __getAnimatedWidgetForLanguage(String language, int position) {
    //print('Getting widget for language $language');
    var color = Colors.red;
    if (language == 'EN') {
      color = Colors.blue;
    }
    if (language == 'DE') {
      color = Colors.green;
    }
    //print("LANGUAGE $language, position: $position");
    return AnimatedPositioned(
      bottom: _selectionIsOpen ? position * 60 : 0,
      curve: Curves.easeInBack,
      left: 0,
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () => {
          setState(() {
            _selectionIsOpen = !_selectionIsOpen;
            _selectedLanguage = language;
            _selectedWidget = _getWidgetForLanguage(language);
          }),
        },
        child: SizedBox(width: 50, height: 50, child: Container(color: color)),
      ),
    );
  }

  Widget _getWidgetForLanguage(String language) {
    var color = Colors.red;
    if (language == 'EN') {
      color = Colors.blue;
    }
    if (language == 'DE') {
      color = Colors.green;
    }

    return SizedBox(width: 50, height: 50, child: Container(color: color));
  }

  Widget _getControlWidget() {
    //print("LANGUAGE $language, position: $position");
    return Positioned(
      left: 0,
      bottom: 0,
      width: 50,
      height: 50,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectionIsOpen = !_selectionIsOpen;
          });
        },
        child: AnimatedCrossFade(
          crossFadeState: _selectionIsOpen
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: _selectedWidget,
          secondChild: SizedBox(
              width: 50, height: 50, child: Container(color: Colors.grey)),
          duration: const Duration(milliseconds: 500),
        ),
      ),
    );
  }
}
