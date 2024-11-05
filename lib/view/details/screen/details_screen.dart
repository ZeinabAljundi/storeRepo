import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:storapplication/core/constances/all_icons.dart';
import '../../../core/constances/all_colors.dart';
import '../../../core/service/media_query_service.dart';
import '../../../modle/product_modle.dart';
// Import CartController
import '../../my_cart/controller/my_cart_controller.dart';
import '../controller/details_controller.dart';

class DetaileScreen extends StatelessWidget {
  const DetaileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();  // Instantiate CartController
    return Scaffold(
      backgroundColor: MyColor.mybackgroundColor,
      appBar: AppBar(
        backgroundColor: MyColor.mybackgroundColor,
        centerTitle: true,
        title: Text(
          'T-shirt Shop',
          style: TextStyle(
            fontFamily: GoogleFonts.raleway().fontFamily,
            color: MyColor.myBlack,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Change to your back icon
          onPressed: () {
            Get.toNamed("/HomeScreen"); // Navigate back to home screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart), // Change to your cart icon
            onPressed: () {
              Get.toNamed("/MyCartScreen");
            },
          ),
        ],
      ),
      body: GetBuilder<DetailsController>(
        init: DetailsController(), // Initialize the controller
        builder: (controller) {
          if (controller.isLoading.value) {
            return Center(
                child: CircularProgressIndicator()); // Show loading indicator
          } else {
            final product = controller.product.value; // Get the product
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                          fontFamily: GoogleFonts.raleway().fontFamily,
                          color: MyColor.myBlack,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      product.subCategory.name,
                      style: TextStyle(
                        fontFamily: GoogleFonts.raleway().fontFamily,
                        color: MyColor.myGray,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      "\$${product.price}",
                      style: TextStyle(
                        fontFamily: GoogleFonts.raleway().fontFamily,
                        color: MyColor.myBlack,
                        fontSize: 30.0,
                      ),
                    ),
                    SizedBox(height: MySize.screenHeight(context) * 0.015),
                    Center(
                      child: Image.asset(
                        'assets/images/tshirt.png', // Replace with your image path
                        height: MySize.screenHeight(context) * 0.16,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: MySize.screenHeight(context) * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/tshirt.png', // Replace with your image path
                          height: MySize.screenHeight(context) * 0.06,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/images/tshirt.png', // Replace with your image path
                          height: MySize.screenHeight(context) * 0.06,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/images/tshirt.png', // Replace with your image path
                          height: MySize.screenHeight(context) * 0.06,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/images/tshirt.png', // Replace with your image path
                          height: MySize.screenHeight(context) * 0.06,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/images/tshirt.png', // Replace with your image path
                          height: MySize.screenHeight(context) * 0.06,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    SizedBox(height: MySize.screenHeight(context) * 0.05),
                    Text(
                      "Programming and Software Engineering are your passion? Then this is made for you as a developer. Perfect surprise for any programmer, software engineer, developer, coder, computer nerd out there ......",
                      style: TextStyle(
                        fontFamily: GoogleFonts.raleway().fontFamily,
                        color: MyColor.myGray,
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(height: MySize.screenHeight(context) * 0.03),
                    Row(
                      children: [
                        SizedBox(width: MySize.screenWidth(context) * 0.07),
                        IconButton(
                          onPressed: () {
                            // Add to favorites logic, if any
                          },
                          icon: Icon(Icons.favorite_border),
                        ),
                        SizedBox(width: MySize.screenWidth(context) * 0.13),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(MyColor.basicGreen)),
                          onPressed: () {
                            // cartController.addItem(CartItem(name: product.name, price: product.price));
                            // Get.snackbar("Success", "${product.name} added to cart!",
                            //     snackPosition: SnackPosition.BOTTOM);
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            width: MySize.screenWidth(context) * 0.40,
                            height: MySize.screenHeight(context) * 0.06,
                            child: Row(
                              children: [
                                myIcon.navCart,
                                SizedBox(
                                  width: MySize.screenWidth(context) * 0.04,
                                ),
                                Text(
                                  "Add to cart",
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.raleway().fontFamily,
                                    color: MyColor.myWhite,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
