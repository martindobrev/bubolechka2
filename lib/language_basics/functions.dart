///
/// This file demonstrates some dart basic functions
///

// Some example Functions
void greetMe() {
  print('Hi!');
}

String getSomeText() {
  return 'some text';
}

void _privateFunction() {
  print('CANNOT BE CALLED OUTSIDE OF THIS CONTEXT');
}

void positionedParameters(String label, String value) {
  print('LABEL: $label, VALUE: $value');
}

void defaultParameters(String value, [String label = 'LABEL']) {
  positionedParameters(value, label);
}

// note the brackets for positional argumentns
void optionalParameters({String param1 = '1', String? param2}) {
  print('param1: $param1');
  if (param2 != null) {
    print('param2: $param2');
  }
}
