part of 'controllers.dart';

class UserController extends GetxController {
  final _user = User().obs;
  String message;

  User get user => this._user.value;
  set user(User value) => this._user.value = value;

  void clear() => _user.value = User();

  Future<bool> signIn({String username, String password}) async {
    ApiResponse<User> result = await UserServices.signIn(username, password);

    if (result != null) {
      user = result.value;
      message = result.message;
      return true;
    } else {
      message = result.message;
      return false;
    }
  }

  Future<bool> signUp(User user) async {
    ApiResponse<User> result = await UserServices.signUp(user);

    if (result != null) {
      user = result.value;
      message = result.message;
      return true;
    } else {
      message = result.message;
      return false;
    }
  }
}
