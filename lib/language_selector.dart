import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';

/// Available languages
const languages = ['BG', 'US', 'DE', 'ES'];

///
/// Callback function definition that will be used to notify the parent widget
/// about language changes
///
typedef LanguageChangeCallback = void Function(String newLanguage);

///
/// Language selector widget
///
/// Displays the current selected language with a flag (default is bulgarian).
/// When clicking on the flag, all available options popup and can be selected.
///
/// The widget uses a stack layout and AnimatedPositioned for the animations.
///
class LanguageSelector extends StatefulWidget {
  /// callback function to notify the parent about language changes
  /// if set, it will be triggered when
  LanguageChangeCallback? onLanguageChange;

  /// open widget horizontally
  bool isHorizontal;

  LanguageSelector(this.isHorizontal, {super.key, this.onLanguageChange});

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
      selectionWidgets.add(__getAnimatedWidgetForLanguage(
          widget.isHorizontal, languages[i], i + 1));
    }

    return Stack(
      children: [
        ...selectionWidgets,
        _getControlWidget(),
      ],
    );
  }

  Widget __getAnimatedWidgetForLanguage(
      bool isHorizontal, String language, int position) {
    double xPosition = 0;
    double yPosition = 0;

    if (isHorizontal) {
      xPosition = _selectionIsOpen ? position * 60 : 0;
    } else {
      yPosition = _selectionIsOpen ? position * 60 : 0;
    }

    //print('xPosition: $xPosition, yPosition: $yPosition');
    return AnimatedPositioned(
      bottom: yPosition,
      curve: Curves.easeInBack,
      right: xPosition,
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
          onTap: () => {
                setState(() {
                  _selectionIsOpen = !_selectionIsOpen;
                  if (language != _selectedLanguage) {
                    _selectedLanguage = language;
                    _selectedWidget = _getWidgetForLanguage(language);
                    if (widget.onLanguageChange != null) {
                      widget.onLanguageChange!(language);
                    }
                  }
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
      right: 0,
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
