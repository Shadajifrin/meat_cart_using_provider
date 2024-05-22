import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:meat_cart_using_provider/controller/product_controller.dart';
import 'package:meat_cart_using_provider/view/productview.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ProductListView(),
      floatingActionButton: Consumer<ProductProvider>(
        builder: (context, controller, child) {
          return FloatingActionButton(
            child: Badge(
              badgeContent: Text(controller.itemCount.toString()),
              child: const Icon(Icons.shopping_cart),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder:  controller.navigateToCartScreen(context),),
            ),
          );
        },
      ),
    );
  }
}