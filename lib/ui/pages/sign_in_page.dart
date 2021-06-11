part of 'pages.dart';

class SignInPage extends GetView<TextFieldController> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(defMargin),
              child: Column(
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 150,
                  ),
                  CustomTextField(
                    marginTop: 16,
                    controller: usernameController,
                    hintText: "Type your username",
                    type: "username",
                  ),
                  CustomTextField(
                    marginTop: 16,
                    controller: passwordController,
                    action: TextInputAction.done,
                    hintText: "Type your password",
                    type: "password",
                  ),
                  CustomButton(
                    margin: EdgeInsets.only(top: 16),
                    text: "Sign In",
                    onTap: () {
                      if (usernameController.text.isEmpty) {
                        controller.validate(usernameController, "username");
                      } else if (passwordController.text.isEmpty ||
                          passwordController.text.length < 6 ||
                          isAlphanumeric()) {
                        controller.validate(passwordController, "password");
                      } else {
                        login();
                      }
                    },
                  ),
                  CustomButton(
                    margin: EdgeInsets.only(top: 16),
                    color: white,
                    borderColor: blue,
                    textColor: blue,
                    text: "Sign Up",
                    onTap: () {
                      controller.clear();
                      Get.to(() => SignUpPage());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isAlphanumeric() {
    var s = RegExp(r'^[a-zA-Z0-9]+$');

    return s.hasMatch(passwordController.text);
  }

  void login() async {
    var userController = Get.find<UserController>();

    bool result = await userController.signIn(
      username: usernameController.text.trim(),
      password: passwordController.text.trim(),
    );

    if (result) {
      Get.snackbar(
        'Login Success',
        userController.message,
        backgroundColor: green,
        duration: Duration(seconds: 2),
      );
      Get.off(MainPage());
    } else {
      Get.snackbar(
        'Login Failed',
        userController.message,
        backgroundColor: red,
        duration: Duration(seconds: 2),
      );
    }
  }
}
