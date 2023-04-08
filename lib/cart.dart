import 'package:flutter/material.dart';
import 'Model/product.dart';

class Cart {
  List<CartItem> items = [];

  void addItem(Product product) {
    bool isExist = false;
    for (CartItem item in items) {
      if (item.product == product) {
        item.quantity++;
        isExist = true;
        break;
      }
    }
    if (!isExist) {
      items.add(CartItem(product: product, quantity: 1));
    }
  }

  void removeItem(CartItem item) {
    items.remove(item);
  }

  void clear() {
    items.clear();
  }

  int get count {
    int itemCount = 0;
    for (CartItem item in items) {
      itemCount += item.quantity;
    }
    return itemCount;
  }

  double get total {
    double totalCost = 0.0;
    for (CartItem item in items) {
      totalCost += double.parse(item.product.price.amount) * item.quantity;
    }
    return totalCost;
  }
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});
}
