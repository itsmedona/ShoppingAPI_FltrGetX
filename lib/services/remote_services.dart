import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/product.dart';

class RemoteServices {
  static var client = http.Client();

  // Fetches products from the given API and returns a list of Product objects.
  static Future<List<Product>?> fetchProducts() async {
    try {
      var response = await client.get(Uri.parse(
          'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return productFromJson(jsonString);
      } else {
        // Handle server errors
        print('Failed to load products. Server responded with status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Handle any other type of errors (e.g., network issues, JSON parsing issues)
      print('Failed to load products. Error: $e');
      return null;
    }
  }

  // Helper method to parse the JSON response and return a list of Product objects.
  static List<Product> productFromJson(String jsonString) {
    final data = json.decode(jsonString) as List;
    return data.map((json) => Product.fromJson(json)).toList();
  }
}
