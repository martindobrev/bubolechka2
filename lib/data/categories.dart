import '../models/bubo_category.dart';

///
/// This file provides the original category data
///

/// Original labels in german and bulgarian, english added as last value
const labels = [
  ["1", "Nissan GTR", "Nissan GTR", "Nissan GTR"],
  ["2", "Subaru Impreza", "Subaru Impreza", "Subaru Impreza"],
  ["3", "Toyota Supra", "Toyota Supra", "Toyota Supra"],
  ["4", "Dodge Challenger SRT", "Dodge Challenger SRT", "Dodge Challenger SRT"],
  ["5", "BMW", "BMW", "BMW"],
  ["6", "Fiat Punto Sporting", "Fiat Punto Sporting", "Fiat Punto Sporting"],
  ["7", "Volkswagen Golf GTI", "Volkswagen Golf GTI", "Volkswagen Golf GTI"],
  ["8", "Mercedes Benz AMG", "Mercedes Benz AMG", "Mercedes Benz AMG"],
  ["9", "Lamborghini Urus", "Lamborghini Urus", "Lamborghini Urus"],
  ["10", "Ferrari", "Ferrari", "Ferrari"],
  ["11", "Mazda Miata", "Mazda Miata", "Mazda Miata"],
  ["12", "Peugeot RS", "Peugeot RS", "Peugeot RS"],
  ["13", "Bugatti Chiron", "Bugatti Chiron", "Bugatti Chiron"],
  ["14", "Reno Megan Sport", "Reno Megan Sport", "Reno Megan Sport"],
  ["15", "Sin R", "Sin R", "Sin R"],
  ["16", "Porsche", "Porsche", "Porsche"],
  ["17", "Citroen", "Citroen", "Citroen"],
  ["18", "Lexus LFA", "Lexus LFA", "Lexus LFA"],
  ["19", "Honda NSX", "Honda NSX", "Honda NSX"],
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
        'us': categoryLabels[1],
        'de': categoryLabels[3],
        'bg': categoryLabels[2],
      });
}).toList();
