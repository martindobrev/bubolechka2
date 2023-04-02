import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';

const languages = ['BG', 'US', 'DE'];

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  var _selectionIsOpen = false;
  var _selectedLanguage = 'BG';
  late Widget _selectedWidget;

  _LanguageSelectorState() {
    _selectedWidget = _getWidgetForLanguage('BG');
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> selectionWidgets = [];
    for (int i = 0; i < languages.length; i++) {
      selectionWidgets.add(__getAnimatedWidgetForLanguage(languages[i], i + 1));
    }

    return Stack(
      children: [
        ...selectionWidgets,
        _getControlWidget(),
      ],
    );
  }

  Widget __getAnimatedWidgetForLanguage(String language, int position) {
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
          child: _getWidgetForLanguage(language)),
    );
  }

  Widget _getWidgetForLanguage(String language) {
    return Container(
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        width: 54,
        height: 54,
        child: Center(child: CircleFlag(language.toLowerCase(), size: 50)));
  }

  Widget _getControlWidget() {
    return Positioned(
      left: 0,
      bottom: 0,
      width: 54,
      height: 54,
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
          secondChild: Container(
            decoration:
                const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
            width: 54,
            height: 54,
            child: const Icon(Icons.arrow_downward_sharp, color: Colors.white),
          ),
          duration: const Duration(milliseconds: 500),
          firstCurve: Curves.bounceIn,
          secondCurve: Curves.bounceOut,
        ),
      ),
    );
  }
}
