import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/my_cart_controller.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find<CartController>(); // Access CartController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Display Cart Items
          Expanded(
            child: GetBuilder<CartController>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = controller.cartItems[index];
                    return Dismissible(
                      key: ValueKey(item.name),  // Ensure each item has a unique key
                      direction: DismissDirection.endToStart,  // Only allow right-to-left swipe
                      background: Container(
                        color: Colors.red,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                        ),
                      ),
                      confirmDismiss: (direction) async {
                        // Show a confirmation dialog before dismissal
                        return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirm Removal"),
                              content: Text("Are you sure you want to remove ${item.name} from the cart?"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(false), // Do not dismiss
                                  child: Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(true), // Dismiss
                                  child: Text("Remove"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      onDismissed: (direction) {
                        // Remove the item and show a snackbar
                        controller.removeItem(index);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${item.name} removed from cart")),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)],
                        ),
                        child: ListTile(
                          title: Text(item.name),
                          subtitle: Text("\$${item.price.toStringAsFixed(2)} (x${item.quantity})"), // Display quantity
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () => controller.decreaseQuantity(index),
                              ),
                              Text('${item.quantity}'), // Show the quantity
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () => controller.increaseQuantity(index),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}







//
// return ListView.builder(
// itemCount: controller.cartItems.length,
// itemBuilder: (context, index) {
// final item = controller.cartItems[index];
// return ListTile(
// title: Text(item.name),
// subtitle: Text("\$${item.price.toStringAsFixed(2)}"),
// trailing: IconButton(
// icon: Icon(Icons.delete),
// onPressed: () {
// controller.removeItem(index);
// },
// ),
// );
// },
// );