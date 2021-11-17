import 'package:dart_application_1/dart_application_1.dart'
    as dart_application_1;

import 'creational/singleton.dart';

void main(List<String> arguments) {
  var x = SingletonObject.getInstance();
  x.showCounter();
  var x1 = SingletonObject.getInstance();
  x1.showCounter();
  var x2 = SingletonObject.getInstance();
  x2.showCounter();
}
