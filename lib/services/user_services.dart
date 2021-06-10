part of 'services.dart';

class UserServices {
  static Future<ApiResponse<User>> signIn(
      String username, String password) async {
    var client = http.Client();

    Uri url = Uri.parse(baseURL + 'login');

    var response = await client.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "x-token": "12345678",
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode != 200) {
      return ApiResponse(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    User value = User.fromJson(data);

    return ApiResponse(value: value, message: 'Welcome');
  }

  static Future<ApiResponse<User>> signUp(User user) async {
    var client = http.Client();

    Uri url = Uri.parse(baseURL + 'register');

    var response = await client.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "x-token": "12345678",
      },
      body: jsonEncode(<String, String>{
        'username': user.username,
        'email': user.email,
        'password': user.password,
      }),
    );

    if (response.statusCode != 200) {
      return ApiResponse(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    User value = User.fromJson(data);

    return ApiResponse(value: value, message: 'Welcome');
  }
}
