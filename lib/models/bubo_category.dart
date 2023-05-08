import 'bubo_card.dart';

///
/// Data structure for categories
///
/// Each category must have the following fields:
/// - id: unique integer for identification
/// - image: link to an asset for the background image
/// - translatedLabels: Map consisting of labels for all available languages
///   Here is a simple examlpe:
///   {"us": "English label", "de": "German label", "bg": "име на български"}
///
///
class BuboCategory {
  int id;
  String image;
  Map<String, String> translatedLabels;
  List<BuboCard> cards;

  BuboCategory(this.id, this.image, this.translatedLabels, this.cards);
}
