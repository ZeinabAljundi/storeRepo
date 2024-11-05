import 'package:get/get.dart';
import '../../../modle/product_modle.dart';
 // Adjust the import according to your project structure

class FavoriteController extends GetxController {
  // Reactive list to hold favorite products
  var favorites = <ProductModle>[].obs;

  // Method to toggle favorite status of a product
  void toggleFavorite(ProductModle product) {
    if (favorites.contains(product)) {
      favorites.remove(product); // Remove from favorites if already added
      Get.snackbar("Removed", "${product.name} removed from favorites!");
    } else {
      favorites.add(product); // Add to favorites
      Get.snackbar("Added", "${product.name} added to favorites!");
    }
  }

  // Method to check if a product is favorited
  bool isFavorited(ProductModle product) {
    return favorites.contains(product);
  }
}
