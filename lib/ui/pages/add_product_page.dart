part of 'pages.dart';

class AddProductPage extends StatefulWidget {
  final Product product;

  AddProductPage({this.product});

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final codeController = TextEditingController();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final stockController = TextEditingController();
  final controller = Get.find<TextFieldController>();
  final productController = Get.find<ProductController>();
  String title;

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      title = 'EDIT';
      codeController.text = widget.product.code;
      nameController.text = widget.product.name;
      priceController.text = widget.product.price.toString();
      stockController.text = widget.product.stock.toString();
    } else {
      title = 'ADD';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        backgroundColor: blue,
      ),
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 40,
            horizontal: defMargin,
          ),
          child: ListView(
            children: [
              FieldName(text: 'Code'),
              CustomTextField(
                marginTop: 8,
                controller: codeController,
                caps: TextCapitalization.characters,
                hintText: "Type the product code",
                type: 'code',
              ),
              FieldName(
                text: 'Name',
                margin: EdgeInsets.only(top: 16),
              ),
              CustomTextField(
                marginTop: 8,
                controller: nameController,
                caps: TextCapitalization.words,
                hintText: "Type the product name",
                type: 'name',
              ),
              FieldName(
                text: 'Price',
                margin: EdgeInsets.only(top: 16),
              ),
              CustomTextField(
                marginTop: 8,
                controller: priceController,
                inputType: TextInputType.number,
                hintText: "Type the product price",
                type: 'price',
              ),
              FieldName(
                text: 'Stock',
                margin: EdgeInsets.only(top: 16),
              ),
              CustomTextField(
                marginTop: 8,
                controller: stockController,
                inputType: TextInputType.number,
                hintText: "Type the product stock",
                type: 'stock',
              ),
              CustomButton(
                text: 'Save',
                margin: EdgeInsets.only(top: defMargin),
                onTap: () async {
                  if (codeController.text.isEmpty) {
                    controller.validate(codeController, 'code');
                  } else if (nameController.text.isEmpty) {
                    controller.validate(nameController, 'name');
                  } else if (priceController.text.isEmpty) {
                    controller.validate(priceController, 'price');
                  } else if (stockController.text.isEmpty) {
                    controller.validate(stockController, 'stock');
                  } else {
                    if (widget.product == null) {
                      insert();
                    } else {
                      update();
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void insert() async {
    bool result = await productController.insert(Product(
      id: await productController.count() + 1,
      code: codeController.text.trim(),
      name: nameController.text,
      price: int.parse(priceController.text),
      stock: int.parse(stockController.text),
    ));

    String msg = productController.message;

    if (result) {
      Get.snackbar(
        'Success',
        msg,
        backgroundColor: green,
        duration: Duration(seconds: 2),
      );
      Get.off(MainPage());
    } else {
      Get.snackbar(
        'Failed',
        msg,
        backgroundColor: red,
        duration: Duration(seconds: 2),
      );
    }
  }

  void update() async {
    bool result = await productController.edit(Product(
      id: widget.product.id,
      code: codeController.text.trim(),
      name: nameController.text,
      price: int.parse(priceController.text),
      stock: int.parse(stockController.text),
    ));

    String msg = productController.message;

    if (result) {
      Get.snackbar(
        'Success',
        msg,
        backgroundColor: green,
        duration: Duration(seconds: 2),
      );
      Get.off(MainPage());
    } else {
      Get.snackbar(
        'Failed',
        msg,
        backgroundColor: red,
        duration: Duration(seconds: 2),
      );
    }
  }
}
