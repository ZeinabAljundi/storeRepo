import 'package:get/get.dart';

// Updated CartItem class to include quantity
class CartItem {
  final String name;
  final double price;
  int quantity; // Add quantity property

  CartItem({required this.name, required this.price, this.quantity = 1}); // Default quantity is 1
}
class CartController extends GetxController {
  List<CartItem> cartItems = []; // Regular list, not observable

  void addItem(CartItem item) {
    // Check if the item already exists in the cart
    for (var existingItem in cartItems) {
      if (existingItem.name == item.name) {
        existingItem.quantity++; // Increment quantity if exists
        update(); // Notify listeners to rebuild using GetBuilder
        return;
      }
    }
    cartItems.add(item); // Add new item to the cart
    update(); // Notify listeners to rebuild using GetBuilder
  }

  void removeItem(int index) {
    if (index >= 0 && index < cartItems.length) {
      cartItems.removeAt(index); // Remove item from the cart
      update(); // Notify listeners to rebuild
    }
  }

  // Method to increase the quantity of an item
  void increaseQuantity(int index) {
    if (index >= 0 && index < cartItems.length) {
      cartItems[index].quantity++; // Increment quantity
      update(); // Notify listeners to rebuild
    }
  }

  // Method to decrease the quantity of an item
  void decreaseQuantity(int index) {
    if (index >= 0 && index < cartItems.length) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--; // Decrement quantity
      } else {
        removeItem(index); // Remove item if quantity is 1
      }
      update(); // Notify listeners to rebuild
    }
  }
}
