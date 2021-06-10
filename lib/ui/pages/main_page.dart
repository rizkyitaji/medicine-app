part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductController>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blue,
          title: Text('Medicine'),
          actions: [
            IconButton(
              onPressed: () => Get.to(AddProductPage()),
              icon: Icon(Icons.add),
            ),
            SizedBox(width: 8),
            IconButton(
              onPressed: () {
                Get.find<UserController>().clear();
                Get.off(SignInPage());
              },
              icon: Icon(Icons.logout),
            ),
            SizedBox(width: 8),
          ],
        ),
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: GetBuilder<ProductController>(
            init: ProductController(),
            builder: (state) {
              if (state.products.length == 0) {
                return Center(
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/not_found.png',
                          width: 300,
                          height: 200,
                        ),
                        SizedBox(height: 8),
                        Text('No Data', style: blackFont),
                      ],
                    ),
                  ),
                );
              } else {
                return RefreshIndicator(
                  onRefresh: () async {
                    state.getProducts();
                  },
                  child: ListView(
                    children: state.products
                        .map((e) => Container(
                              margin: EdgeInsets.only(bottom: 1),
                              child: ProductListItem(e),
                            ))
                        .toList(),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
