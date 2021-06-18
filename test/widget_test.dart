import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Check alphanumeric character", () {
    var string = "abc";

    expect(string.contains(RegExp(r'[a-zA-Z0-9]')) == true, true);
  });
}
