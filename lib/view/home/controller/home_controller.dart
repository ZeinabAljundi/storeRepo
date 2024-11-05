import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../modle/product_modle.dart';
import '../../details/screen/details_screen.dart';
import '../../favorite/screen/favorite_screen.dart';
import '../../my_cart/controller/my_cart_controller.dart';
import '../../my_cart/screen/my_cart_screen.dart';
import '../../profile/screen/profile_screen.dart';
import '../screen/home_screen.dart';

class HomeController extends GetxController {
  late Future<List<dynamic>> futurePosts;
  TextEditingController searchText = TextEditingController();
  bool isFavorited = false;

  final url = 'https://task.focal-x.com/api/products';
  int selectedIndex = 0;
  List<ProductModle> products = []; // List to store products
  bool isLoading = false;
  void updateIndex(int index) {
    selectedIndex = index;
    update();
  }



  final CartController cartController = Get.put(CartController());

  void toggleFavorite() {
    isFavorited = !isFavorited;
    update(); // Toggle favorite state
  }

  void changeIndex(int index) {
    selectedIndex = index; // Update the selected index
    update(); // Call update to refresh the UI
  }

  void addItemToCart(ProductModle product) {
    CartItem newItem = CartItem(name: product.name, price: product.price.toDouble());
    Get.find<CartController>().addItem(newItem);
  }

  Future<void> getData() async {
    try {
      isLoading = true; // Set loading state to true
      update(); // Trigger UI update

      // Fetch product data
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer 1755|1jRysNPsqEMxmNpCpJX5lUehAtsBTuA7Q4NiDKEqb594e257', // Use your token
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print('Response body: ${response.body}'); // Log the response
        final data = json.decode(response.body);

        // Correctly access the 'data' key instead of 'products'
        if (data['data'] is List) {
          products = List<ProductModle>.from(data['data'].map((item) => ProductModle.fromJson(item)));
        } else {
          print('No products found in the response'); // Log the case where products are not found
        }
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('There is a problem: $e');
    } finally {
      isLoading = false; // Ensure loading state is set to false
      update(); // Update the UI again
    }
  }

  void fetchAndPrintProductDetails() {
    getData(); // Call the data fetching method
  }
}
