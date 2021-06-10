part of 'models.dart';

class ApiResponse<T> {
  final T value;
  final String message;

  ApiResponse({
    this.value,
    this.message,
  });
}
