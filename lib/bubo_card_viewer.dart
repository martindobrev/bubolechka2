import 'package:bubolechka2/models/bubo_card.dart';
import 'package:flutter/material.dart';

///
/// Widget displaying scrollable pages for each card in a selected category
///
/// For changing the cards, a PageView widget is used
///
class BuboCardViewer extends StatelessWidget {
  final List<BuboCard> cards;

  const BuboCardViewer(this.cards, {super.key});

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
          child: Center(
              child: Image.asset(
                  'assets/cards/${card.file.replaceAll('.aac', '@3x.png')}')),
        );
      },
    ).toList();
  }
}
