// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_git/utils/utils_gmAvatar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_git/utils/person.dart';


void main() {
  test('test', () {
    Person person = Person('张三',18);
    print(person.name);
  });

  test('test', () {
    Person person = Person('张三',18);
    print(person.age);
  });
}
