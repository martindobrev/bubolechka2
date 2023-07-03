import 'package:bubolechka2/models/bubo_card.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

///
/// Widget displaying scrollable pages for each card in a selected category
///
/// For changing the cards, a PageView widget is used
///
class BuboCardViewer extends StatefulWidget {
  final List<BuboCard> cards;
  final String language;
  FlutterTts flutterTts = FlutterTts();

  BuboCardViewer(this.cards, this.language, {super.key}) {
    flutterTts.setLanguage(language);
    flutterTts.setSpeechRate(0.7);
  }

  @override
  State<BuboCardViewer> createState() => _BuboCardViewerState();
}

class _BuboCardViewerState extends State<BuboCardViewer> {
  final AudioPlayer audioPlayer = AudioPlayer();
  var _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return Stack(
      children: [
        Positioned(
          bottom: 0,
          top: 0,
          left: 0,
          right: 0,
          child: PageView(
              scrollDirection: Axis.vertical,
              controller: controller,
              onPageChanged: (value) => setState(() {
                    _currentPage = value;
                  }),
              children: _getPages()),
        ),
        Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            height: 20,
            child: PageViewDotIndicator(
              count: widget.cards.length,
              currentItem: _currentPage,
              selectedColor: Colors.primaries.first,
              unselectedColor: Colors.primaries.last,
            )),
        Positioned(
            right: 20, bottom: 20, width: 50, height: 50, child: _backButton())
      ],
    );
  }

  List<Widget> _getPages() {
    return widget.cards.map(
      (card) {
        return Padding(
          padding: const EdgeInsets.all(100.0),
          child: GestureDetector(
            onTap: () {
              if (widget.language.toLowerCase() == 'bg') {
                audioPlayer
                    .play(DeviceFileSource('assets/voice/${card.audioFile}'));
              } else {
                _speak(card.translatedLabels[widget.language]!);
              }
            },
            child: Center(
                child: Image.asset(
                    'assets/cards/${card.file.replaceAll('.aac', '@3x.png')}')),
          ),
        );
      },
    ).toList();
  }

  Future _speak(String text) async {
    print('Speaking: $text');
    var result = await widget.flutterTts.speak(text);
    print('RESULT IS: $result');
  }

  Widget _backButton() {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
          decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/back_button_image.png'),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      )),
    );
  }
}
