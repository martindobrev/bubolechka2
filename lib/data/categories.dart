import 'package:bubolechka2/data/cards.dart';

import '../models/bubo_category.dart';

///
/// This file provides the original category data
///

/// Original labels in german and bulgarian, english added as last value
const labels = [
  ["1", "Obst", "плодове", "fruits", "frutas"],
  ["2", "Farben", "цветове", "colors", "colores"],
  ["3", "Moebel", "мебели", "furniture", "muebles"],
  ["4", "Sachen", "дрехи", "clothes", "ropa"],
  ["5", "Spielzeug", "играчки", "toys", "juguetes"],
  ["6", "Tiere", "животни", "animals", "animales"],
  ["7", "Wilde Tiere", "диви животни", "wild animals", "animales salvajes"],
  ["8", "Zahlen", "цифри", "digits", "dígitos"],
  ["9", "Wetter", "времето", "weather", "clima"],
  ["10", "Zu Hause", "вкъщи", "at home", "en casa"],
  ["11", "Natur", "природа", "nature", "naturaleza"],
  ["12", "Im Meer", "морето", "sea", "mar"],
  ["13", "Am Strand", "на плажа", "on the beach", "en la playa"],
  ["14", "Sport", "спорт", "sport", "deporte"],
  ["15", "Stadt", "град", "city", "ciudad"],
  ["16", "Berufe", "професии", "professions", "profesiones"],
  ["17", "Fahrzeuge", "транспрорт", "transport", "transporte"],
  ["18", "Gemuese", "зеленчуци", "vegetables", "verduras"]
];

///
/// Labels transformed into BuboCategories
///
/// This list can be used in the application for rendering the categories
///
List<BuboCategory> buboCategories = labels.map((categoryLabels) {
  return BuboCategory(
      int.parse(categoryLabels[0]),
      'assets/categories/cat_${categoryLabels[1].toLowerCase().replaceAll(' ', '_')}@3x.png',
      {
        'us': categoryLabels[3],
        'de': categoryLabels[1],
        'bg': categoryLabels[2],
        'es': categoryLabels[4]
      },
      cards
          .where(
            (card) => card.categoryId == int.parse(categoryLabels[0]),
          )
          .toList());
}).toList();
