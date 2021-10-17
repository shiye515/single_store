import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:single_store/single_store.dart';

class MyController with ChangeNotifier {
  int count = 0;

  MyController() {
    count += 1;
  }
}

void main() {
  test('constructor only run once', () {
    final store = SingleStore();
    expect(store.get(() => MyController()).count, 1);
    expect(store.get(() => MyController()).count, 1);
  });
}
