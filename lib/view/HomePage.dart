import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controller/product_controller.dart';
import 'product_tile.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'ShopiFy',
                      style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.view_list_rounded),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.grid_view),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Obx(() {
            if (productController.isLoading.value)
              return SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            else
              return SliverPadding(
                padding: EdgeInsets.all(16),
                sliver: SliverGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: List.generate(
                    productController.productList.length,
                    (index) => ProductTile(productController.productList[index]),
                  ),
                ),
              );
          }),
        ],
      ),
    );
  }
}
