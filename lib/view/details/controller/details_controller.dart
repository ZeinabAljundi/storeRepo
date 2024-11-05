import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../modle/product_modle.dart';
import '../../my_cart/controller/my_cart_controller.dart'; // Ensure this path is correct

class DetailsController extends GetxController {
  final String url = 'https://task.focal-x.com/api/products'; // Your API endpoint
  var isLoading = true.obs; // Observable to track loading state
  var product = ProductModle(
    id: 0,
    name: '',
    subCategory: SubCategory(id: 0, name: '', category: Category(id: 0, name: '')),
    image: '',
    price: 0,
    evaluation: 0,
    discount: 0,
  ).obs; // Observable for the product model

  @override
  void onInit() {
    super.onInit();
    fetchProductDetails(); // Fetch product details when the controller is initialized
  }

  void addItemToCart(ProductModle product) {
    CartItem newItem = CartItem(name: product.name, price: product.price.toDouble());
    Get.find<CartController>().addItem(newItem);
  }
  Future<void> fetchProductDetails() async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer 1755|1jRysNPsqEMxmNpCpJX5lUehAtsBTuA7Q4NiDKEqb594e257',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Parse the JSON response
        var jsonResponse = jsonDecode(response.body);
        // Assuming the API returns a list of products
        if (jsonResponse['data'] != null && jsonResponse['data'].isNotEmpty) {
          // Use the first product for details or implement a logic to fetch specific product
          var productData = jsonResponse['data'][0]; // Just as an example
          product.value = ProductModle.fromJson(productData); // Update observable product
        } else {
          Get.snackbar("Error", "No product details found");
        }
      } else {
        Get.snackbar("Error", "Failed to load product details: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    } finally {
      isLoading.value = false; // Set loading to false
      update(); // Notify listeners to rebuild UI
    }
  }
}
