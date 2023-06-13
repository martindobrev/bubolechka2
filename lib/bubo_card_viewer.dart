import 'package:bubolechka2/models/bubo_card.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';

///
/// Widget displaying scrollable pages for each card in a selected category
///
/// For changing the cards, a PageView widget is used
///
class BuboCardViewer extends StatelessWidget {
  final List<BuboCard> cards;
  final AudioPlayer audioPlayer = AudioPlayer();
  final String language;
  FlutterTts flutterTts = FlutterTts();

  BuboCardViewer(this.cards, this.language, {super.key}) {
    flutterTts.setLanguage(language);
    flutterTts.setSpeechRate(0.7);
  }

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
              children: _getPages()),
        ),
        Positioned(
          right: 20,
          bottom: 20,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('back'),
          ),
        )
      ],
    );
  }

  List<Widget> _getPages() {
    return cards.map(
      (card) {
        return Padding(
          padding: const EdgeInsets.all(100.0),
          child: GestureDetector(
            onTap: () {
              if (language.toLowerCase() == 'bg') {
                audioPlayer
                    .play(DeviceFileSource('assets/voice/${card.audioFile}'));
              } else {
                _speak(card.translatedLabels[language]!);
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
    var result = await flutterTts.speak(text);
    print('RESULT IS: $result');
  }
}
