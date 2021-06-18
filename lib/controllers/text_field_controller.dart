part of 'controllers.dart';

class TextFieldController extends GetxController {
  final _isValid = true.obs;
  final _obscureText = true.obs;
  String message = '';
  String type;

  bool get isValid => this._isValid.value;
  set isValid(bool value) => this._isValid.value = value;

  bool get obscureText => this._obscureText.value;
  set obscureText(bool value) => this._obscureText.value = value;

  void clear() => type = '';

  void validate(TextEditingController controller, String tag) {
    type = tag;
    if (controller.text.isEmpty) {
      isValid = false;
      message = "Please fill in this field";
      update();
    } else if (tag == 'password' && controller.text.length < 6) {
      isValid = false;
      message = "Password must be at least 6 characters";
      update();
    } else if (tag == 'password' && !Check.isAlphanumeric(controller.text)) {
      isValid = false;
      message = "Password must contains alphanumeric characters";
      print(Check.isAlphanumeric(controller.text));
      update();
    } else if (tag == 'email' && !controller.text.contains('@')) {
      isValid = false;
      message = "Invalid value for email address";
      update();
    } else {
      isValid = true;
      update();
    }
  }
}
