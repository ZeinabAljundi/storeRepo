import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/favorite_controller.dart';

class FavoritesScreen extends StatelessWidget {
  final FavoriteController favoriteController = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: Obx(() {
        if (favoriteController.favorites.isEmpty) {
          return Center(child: Text("No favorites yet."));
        }

        return ListView.builder(
          itemCount: favoriteController.favorites.length,
          itemBuilder: (context, index) {
            final product = favoriteController.favorites[index];
            return ListTile(
              leading: Image.asset('assets/images/tshirt.png'), // Example image
              title: Text(product.name),
              subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
              trailing: IconButton(
                icon: Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  favoriteController.toggleFavorite(product); // Remove from favorites
                },
              ),
            );
          },
        );
      }),
    );
  }
}
