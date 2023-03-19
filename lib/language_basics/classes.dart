///
/// This file demonstrates the basics of dart classes
///
///
class Person {
  String name;
  String? phoneNumber;

  Person(this.name, [this.phoneNumber]);

  Person.named({required this.name, this.phoneNumber});

  void greetPerson() {
    print('Hello $name');
  }
}
