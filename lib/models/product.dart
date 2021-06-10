part of 'models.dart';

class Product extends Equatable {
  final int id;
  final String code;
  final String name;
  final int price;
  final int stock;

  Product({this.id, this.code, this.name, this.price, this.stock});

  factory Product.fromMap(Map<String, dynamic> data) {
    return Product(
      id: data['id'],
      code: data['code'],
      name: data['name'],
      price: data['price'],
      stock: data['stock'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': this.code,
      'name': this.name,
      'price': this.price,
      'stock': this.stock,
    };
  }

  @override
  List<Object> get props => [id, code, name, price, stock];
}
