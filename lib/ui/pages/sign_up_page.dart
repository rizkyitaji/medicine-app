part of 'pages.dart';

class SignUpPage extends GetView<TextFieldController> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

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
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                    hintText: "Type your email address",
                    type: "email",
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
                    text: "Sign Up",
                    onTap: () {
                      if (usernameController.text.isEmpty) {
                        controller.validate(usernameController, "username");
                      } else if (emailController.text.isEmpty ||
                          !emailController.text.contains('@')) {
                        controller.validate(emailController, "email");
                      } else if (passwordController.text.isEmpty ||
                          passwordController.text.length < 6 ||
                          isAlphanumeric()) {
                        controller.validate(passwordController, "password");
                      } else {
                        register();
                      }
                    },
                  ),
                  CustomButton(
                    margin: EdgeInsets.only(top: 16),
                    color: white,
                    borderColor: blue,
                    textColor: blue,
                    text: "Back to Sign In",
                    onTap: () => Get.to(() => SignInPage()),
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

  void register() async {
    var userController = Get.find<UserController>();

    bool result = await userController.signUp(
      User(
        username: usernameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );

    if (result) {
      Get.snackbar(
        'Register Success',
        userController.message,
        backgroundColor: green,
        duration: Duration(seconds: 2),
      );
      Get.off(MainPage());
    } else {
      Get.snackbar(
        'Register Failed',
        userController.message,
        backgroundColor: red,
        duration: Duration(seconds: 2),
      );
    }
  }
}
