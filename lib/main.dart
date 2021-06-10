import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine/controllers/controllers.dart';
import 'package:medicine/ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(UserController());
        Get.put(ProductController());
        Get.put(TextFieldController());
      }),
      home: SignInPage(),
    );
  }
}
