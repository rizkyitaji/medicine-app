import 'package:flutter_test/flutter_test.dart';
import 'package:medicine/main.dart';

void main() {
  test("Check alphanumeric character", () {
    var string = "abc123";

    expect(RegExp(r'^[a-zA-Z0-9]+$').hasMatch(string), true);
  });
}
