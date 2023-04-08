import 'dart:convert';
import 'package:http/http.dart' as http;
import '/Model/product.dart';

class ProductService {
  static const _baseUrl = 'https://s3-eu-west-1.amazonaws.com';

  static Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/api.themeshplatform.com/products.json'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<Product>.from(data["data"].map((e) => Product.fromJson(e)));
    } else {
      throw Exception('Failed to load products');
    }
  }
}