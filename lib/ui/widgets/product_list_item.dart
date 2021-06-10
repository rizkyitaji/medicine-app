part of 'widgets.dart';

class ProductListItem extends GetWidget<ProductController> {
  final Product product;

  ProductListItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: white,
      child: Row(
        children: [
          Container(
            color: green,
            padding: EdgeInsets.all(defMargin),
            child: Text(product.code, style: whiteFont),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(product.name, style: blackFont),
                SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text(
                    '${product.stock} item(s) - IDR ${product.price}',
                    style: blackFont,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          InkWell(
            onTap: () => Get.to(AddProductPage(product: product)),
            child: Icon(Icons.edit),
          ),
          SizedBox(width: 8),
          InkWell(
            onTap: () async {
              bool result = await controller.delete(product.id);

              if (result) {
                Get.snackbar(
                  'Success',
                  controller.message,
                  backgroundColor: green,
                  duration: Duration(seconds: 2),
                );
              } else {
                Get.snackbar(
                  'Failed',
                  controller.message,
                  backgroundColor: red,
                  duration: Duration(seconds: 2),
                );
              }
            },
            child: Icon(Icons.delete),
          ),
          SizedBox(width: 12),
        ],
      ),
    );
  }
}
