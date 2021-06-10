part of 'services.dart';

class ProductServices {
  static final dbHelper = DatabaseHelper.instance;

  static Future<ApiResponse<List<Product>>> getProducts() async {
    List<Product> products = await dbHelper.retrieve().then((value) {
      return value.map((e) => Product.fromMap(e)).toList();
    });

    return ApiResponse(value: products);
  }

  static Future<ApiResponse<int>> count() async {
    List<Product> products = await dbHelper.retrieve().then((value) {
      return value.map((e) => Product.fromMap(e)).toList();
    });

    return ApiResponse(value: products.length);
  }

  static Future<ApiResponse<bool>> insert(Product product) async {
    try {
      final id = await dbHelper.insert(product.toMap());
      print(id);
      return ApiResponse(value: true, message: 'Medicine added');
    } catch (e) {
      return ApiResponse(value: false, message: e);
    }
  }

  static Future<ApiResponse<bool>> update(Product product) async {
    try {
      final id = await dbHelper.update(product.toMap());
      print(id);
      return ApiResponse(value: true, message: 'Medicine updated');
    } catch (e) {
      return ApiResponse(value: false, message: e);
    }
  }

  static Future<ApiResponse<bool>> delete(int id) async {
    try {
      await dbHelper.delete(id);
      return ApiResponse(value: true, message: 'Medicine deleted');
    } catch (e) {
      return ApiResponse(value: false, message: e);
    }
  }
}
