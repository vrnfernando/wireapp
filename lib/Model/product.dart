import 'package:wire_apps_test/Model/price.dart';

class Product {
  final String id;
  final String SKU;
  final String name;
  final String brandName;
  final String mainImage;
  final Price price;
  final String stockStatus;
  final String colour;
  final String description;

  Product({
    required this.id,
    required this.SKU,
    required this.name,
    required this.brandName,
    required this.mainImage,
    required this.price,
    required this.stockStatus,
    required this.colour,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      SKU: json['SKU'],
      name: json['name'],
      brandName: json['brandName'],
      mainImage: json['mainImage'],
      price: Price.fromJson(json['price']),
      stockStatus: json['stockStatus'],
      colour: json['colour'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'SKU': SKU,
      'name': name,
      'brandName': brandName,
      'mainImage': mainImage,
      'price': price.toJson(),
      'stockStatus': stockStatus,
      'colour': colour,
      'description': description,
    };
  }
}