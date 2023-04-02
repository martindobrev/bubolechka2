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

  BuboCategory(this.id, this.image, this.translatedLabels);
}

const labels = [
  ["1", "Obst", "плодове", "vegetables"],
  ["2", "Farben", "цветове", "colors"],
  ["3", "Moebel", "мебели", "furniture"],
  ["4", "Sachen", "дрехи", "clothes"],
  ["5", "Spielzeug", "играчки", "toys"],
  ["6", "Tiere", "животни", "animals"],
  ["7", "Wilde Tiere", "диви животни", "wild animals"],
  ["8", "Zahlen", "цифри", "digits"],
  ["9", "Wetter", "времето", "weather"],
  ["10", "Zu Hause", "вкъщи", "at home"],
  ["11", "Natur", "природа", "nature"],
  ["12", "Im Meer", "морето", "sea"],
  ["13", "Am Strand", "на плажа", "on the beach"],
  ["14", "Sport", "спорт", "sport"],
  ["15", "Stadt", "град", "city"],
  ["16", "Berufe", "професии", "professions"],
  ["17", "Fahrzeuge", "транспрорт", "transport"]
];

List<BuboCategory> buboCategories = labels.map((categoryLabels) {
  return BuboCategory(int.parse(categoryLabels[0]),
      'cat_${categoryLabels[1].toLowerCase().replaceAll(' ', '_')}@3x.png', {
    'us': categoryLabels[3],
    'de': categoryLabels[1],
    'bg': categoryLabels[2]
  });
}).toList();
