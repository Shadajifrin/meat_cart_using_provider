import 'package:flutter/material.dart';
import 'package:meat_cart_using_provider/model/products.dart';
import 'package:meat_cart_using_provider/view/screens/cartscreen.dart';


class ProductProvider extends ChangeNotifier {
  List<Product> _allProducts = productlist;
  bool _isItemListScreen = true;
  bool _isCartScreen = false;
  int _itemCount = 0;
  double _price = 0.0;

  List<Product> get allProducts => _allProducts;
  bool get isItemListScreen => _isItemListScreen;
  bool get isCartScreen => _isCartScreen;
  int get itemCount => _itemCount;
  double get price => _price;

   navigateToCartScreen(BuildContext context) {
    _isCartScreen = true;
    _isItemListScreen = false;
    calculatePrice();
    notifyListeners();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartScreen()),
    );
  }

  Future<bool> navigateToItemListScreen() async {
    _isCartScreen = false;
    _isItemListScreen = true;
    notifyListeners();
    return true;
  }

  void increase(int index) {
    _allProducts[index].count++;
    notifyListeners();
    countAllItems();
    calculatePrice();
  }

  void decrease(int index) {
    if (_allProducts[index].count > 0) {
      _allProducts[index].count--;
      notifyListeners();
      countAllItems();
      calculatePrice();
    }
  }

  void removeItems() {
    for (var item in _allProducts) {
      item.count = 0;
    }
    notifyListeners();
    _itemCount = 0;
    calculatePrice();
  }

  void countAllItems() {
    _itemCount = 0;
    for (var element in _allProducts) {
      _itemCount += element.count;
    }
    notifyListeners();
  }

  void calculatePrice() {
    _price = 0.0;
    for (var element in _allProducts) {
      if (element.count > 0) {
        _price += (double.parse(element.price.replaceAll("\$", "").trim()) * element.count);
      }
    }
    notifyListeners();
  }

  VoidCallback? isCheckOutButtonEnabled() {
    if (_itemCount > 0) {
      return () {};
    }
    return null;
  }
}
