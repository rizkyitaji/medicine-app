part of 'controllers.dart';

class ProductController extends GetxController {
  List<Product> products = [];
  String message;

  void getProducts() async {
    ApiResponse<List<Product>> result = await ProductServices.getProducts();

    if (result != null) {
      products = result.value;
      update();
    }
  }

  Future<int> count() async {
    ApiResponse<int> result = await ProductServices.count();

    if (result != null) {
      return result.value;
    } else {
      return null;
    }
  }

  Future<bool> insert(Product product) async {
    ApiResponse<bool> result = await ProductServices.insert(product);

    if (result != null) {
      update();
      message = result.message;
      return result.value;
    } else {
      message = result.message;
      return result.value;
    }
  }

  Future<bool> edit(Product product) async {
    ApiResponse<bool> result = await ProductServices.update(product);

    if (result != null) {
      update();
      message = result.message;
      return result.value;
    } else {
      message = result.message;
      return result.value;
    }
  }

  Future<bool> delete(int id) async {
    ApiResponse<bool> result = await ProductServices.delete(id);

    if (result != null) {
      update();
      message = result.message;
      return result.value;
    } else {
      message = result.message;
      return result.value;
    }
  }
}
