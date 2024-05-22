import 'package:flutter/material.dart';
import 'package:meat_cart_using_provider/controller/product_controller.dart';
import 'package:meat_cart_using_provider/model/products.dart';
import 'package:meat_cart_using_provider/utils/constants.dart';
import 'package:meat_cart_using_provider/view/screens/productdetail.dart';

import 'package:provider/provider.dart';

class ProductListView extends StatelessWidget {
  Widget countButton(int index, void Function(int index) counter, {IconData icon = Icons.add}) {
    return RawMaterialButton(
      onPressed: () {
        counter(index);
      },
      elevation: 2.0,
      fillColor: Colors.white,
      child: Icon(
        icon,
        size: 15,
      ),
      shape: const CircleBorder(),
    );
  }

  Widget gridViewBody(Product item, int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return ProductDetailScreen(item.name, item.image);
            },
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Card(
              child: Image.asset(
                item.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(item.name, style: kItemNameStyle),
           Text(item.price, style: kItemPriceStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              countButton(index, context.read<ProductProvider>().decrease, icon: Icons.remove),
              Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
                  return Text(productProvider.allProducts[index].count.toString());
                },
              ),
              countButton(index, context.read<ProductProvider>().increase),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        return GridView.builder(
          padding: const EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: productProvider.allProducts.length,
          itemBuilder: (_, index) {
            Product item = productProvider.allProducts[index];
            if (productProvider.isItemListScreen) {
              return gridViewBody(item, index, context);
            } else if (productProvider.isCartScreen && item.count > 0) {
              return gridViewBody(item, index, context);
            } else {
              return Container();
            }
          },
        );
      },
    );
  }
}
