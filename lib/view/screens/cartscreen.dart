import 'package:flutter/material.dart';
import 'package:meat_cart_using_provider/controller/product_controller.dart';
import 'package:meat_cart_using_provider/utils/constants.dart';
import 'package:meat_cart_using_provider/view/productview.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Provider.of<ProductProvider>(context, listen: false).removeItems();
              },
              icon: const Icon(Icons.delete_forever),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ProductListView()),
          SizedBox(
            height: 70,
            child: Column(
              children: [
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Consumer<ProductProvider>(
                    builder: (context, productProvider, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total",
                                style: kItemColorStyle.copyWith(fontSize: 12),
                              ),
                              Text(productProvider.price.toString(), style: kItemPriceStyle),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: productProvider.isCheckOutButtonEnabled(),
                            child: const Text("Check out"),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
