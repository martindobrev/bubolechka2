// ENTRY POINT FOR THE LANGUAGE BASICS
import 'package:bubolechka2/language_basics/classes.dart';

void main() {
  //optionalParameters(param1: 'Hello', param2: 'World');
  // aMap.forEach(
  //   (key, value) => positionedParameters(key, value.toString()),
  // );
  // greetMe();

  var p1 = Person.named(name: 'Martin Dobrev');
  p1.greetPerson();
}
