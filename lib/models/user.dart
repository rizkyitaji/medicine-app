part of 'models.dart';

class User extends Equatable {
  final String username;
  final String email;
  final String password;

  User({
    this.username,
    this.email,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }

  @override
  List<Object> get props => [username, email, password];
}
