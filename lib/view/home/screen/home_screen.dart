import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:storapplication/widget/side_menu_drawar.dart';
import '../../../core/service/media_query_service.dart';
import '../../../core/constances/all_colors.dart';
import '../../../core/constances/all_icons.dart';
import '../../../core/constances/text_styles.dart';
import '../../../widget/category.dart';
import '../../my_cart/controller/my_cart_controller.dart';
import '../controller/home_controller.dart';
import 'package:storapplication/modle/product_modle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.mybackgroundColor,
      appBar: AppBar(
        backgroundColor: MyColor.mybackgroundColor,
        centerTitle: true,
        title: myText(size: 0.1, textColor: MyColor.myBlack, text: 'Explore'),
        leading: IconButton(
          icon: myIcon.drawarIcon,
          onPressed: () {
            //Get.to("/SideMenu");
          },
        ),
        actions: [myIcon.cart],
      ),
      body: GetBuilder<HomeController>(
        init: HomeController()..fetchAndPrintProductDetails(),
        builder: (HomeController) {
          return SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                  child: Column(children: [
                    SizedBox(
                      height: MySize.screenHeight(context) * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MySize.screenWidth(context) * 0.7,
                            height: MySize.screenHeight(context) * 0.07,
                            // color: Colors.blueAccent,
                            child: TextFormField(
                              controller: HomeController.searchText,
                              decoration: InputDecoration(
                                hintText: "Looking for...",
                                hintStyle: TextStyle(
                                  fontFamily: GoogleFonts.raleway().fontFamily,
                                  color: MyColor.myGray,
                                  fontSize: MySize.screenWidth(context) * 0.04,
                                ),
                                prefixIcon: Icon(
                                  Icons.search_sharp,
                                  color: MyColor.myGray,
                                  size: MySize.screenWidth(context) * 0.07,
                                ),
                                fillColor: MyColor.myWhite,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: myIcon.greenSitting,
                          onTap: () {},
                        )
                      ],
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: myText(
                          text: "Select Category",
                          size: 0.065,
                          textColor: MyColor.myBlack,
                        )),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      decoration: BoxDecoration(
                        color: MyColor.mybackgroundColor,
                        borderRadius:
                            BorderRadius.circular(12.0), // Rounded corners
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CategoryItem(label: 'man'),
                          CategoryItem(label: 'woman'),
                          CategoryItem(label: 'child'),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        myText(
                            text: "Popular T-shirt",
                            textColor: MyColor.myBlack,
                            size: 0.05),
                        SizedBox(width: MySize.screenWidth(context) * 0.37),
                        GestureDetector(
                          child: myText(
                              text: "See all",
                              textColor: MyColor.basicGreen,
                              size: 0.05),
                          onTap: () {},
                        )
                      ],
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MySize.screenWidth(context) * 0.04),
                        child: Column(
                          children: [
                            GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: HomeController.products.length,
                              itemBuilder: (context, index) {
                                final product = HomeController.products[index];
                                return Stack(
                                  children: [
                                    Container(
                                      height:
                                          MySize.screenHeight(context) * 0.32,
                                      width: MySize.screenWidth(context) * 0.42,
                                      decoration: BoxDecoration(
                                        color: MyColor.myWhite,
                                        borderRadius:
                                            BorderRadius.circular(23.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 2,
                                            blurRadius: 6,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                height: MySize.screenHeight(
                                                        context) *
                                                    0.015),
                                            Center(
                                              child: Image.asset(
                                                'assets/images/tshirt.png', // Replace with your image path
                                                height: MySize.screenHeight(
                                                        context) *
                                                    0.16,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                                height: MySize.screenHeight(
                                                        context) *
                                                    0.01),
                                            Text(
                                              "BEST SELLER",
                                              style: TextStyle(
                                                fontFamily:
                                                    GoogleFonts.raleway()
                                                        .fontFamily,
                                                color: MyColor.basicGreen,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            //   SizedBox(height: MySize.screenHeight(context) * 0.001),
                                            Text(
                                              "${product.name}",
                                              style: TextStyle(
                                                fontFamily:
                                                    GoogleFonts.raleway()
                                                        .fontFamily,
                                                color: MyColor.myGray,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            //  SizedBox(height: MySize.screenHeight(context) * 0.001),
                                            Text(
                                              "\$${product.price.toStringAsFixed(2)}",
                                              style: TextStyle(
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 1.0,
                                      left: 1.0,
                                      child: IconButton(
                                        icon: HomeController.isFavorited
                                            ? myIcon.redFav
                                            : myIcon.grayFav,
                                        color: HomeController.isFavorited
                                            ? Colors.red
                                            : Colors.grey,
                                        onPressed:
                                            HomeController.toggleFavorite,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0.0,
                                      right: 0.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: MyColor.basicGreen,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(23.0),
                                            bottomRight: Radius.circular(23.0),
                                          ),
                                        ),
                                        child: IconButton(
                                          icon: myIcon.addToCart,
                                          onPressed: () {
                                            HomeController.addItemToCart(product);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MySize.screenHeight(context) * 0.025,
                    ),
                    Container(
                      height: MySize.screenHeight(context) * 0.16,
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left Section: Texts and Sparkles
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // "Summer Sale" and Sparkles
                              Row(
                                children: [
                                  Text(
                                    'Summer Sale',
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.raleway().fontFamily,
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 2),
                                  // Sparkle Icons
                                  SvgPicture.asset(
                                    'assets/images/sparkle.svg',
                                    width: 16,
                                    height: 16,
                                  ),
                                  SizedBox(
                                    width: MySize.screenWidth(context) * 0.08,
                                  ),
                                  Image.asset(
                                    'assets/images/new.png',
                                    width: 30,
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              // "15% OFF" Text
                              Text(
                                '15% OFF',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 36,
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              // Additional Sparkles
                            ],
                          ),

                          // Right Section: T-shirt Image and "NEW!" Label
                          Image.asset(
                            'assets/images/tshirt2.png',
                            width: 100,
                            height: 100,
                          ),
                        ],
                      ),
                    )
                  ])));
        },
      ),
      drawer: Drawer(
        backgroundColor: MyColor.mydrawarColor,
        child: ListView(
          padding: EdgeInsets.all(8),
          children: [
            SizedBox(
              height: MySize.screenHeight(context) * 0.04,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                radius: MySize.screenWidth(context) * 0.1,
                child: Image(
                  image: AssetImage("assets/images/profile.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: MySize.screenHeight(context) * 0.02,
            ),
            Text(
              "Programmer X",
              style: TextStyle(color: MyColor.myWhite),
            ),
            SizedBox(
              height: MySize.screenHeight(context) * 0.04,
            ),
            ListTile(
              leading:
                  Icon(color: MyColor.myWhite, Icons.perm_identity_rounded),
              title: Text('Profile', style: TextStyle(color: MyColor.myWhite)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.add_shopping_cart,
                color: MyColor.myWhite,
              ),
              title: Text('MyCart', style: TextStyle(color: MyColor.myWhite)),
              onTap: () {
                // Close the drawer and navigate to the settings screen
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.favorite,
                color: MyColor.myWhite,
              ),
              title: Text('Favorate', style: TextStyle(color: MyColor.myWhite)),
              onTap: () {
                // Close the drawer and navigate to the about screen
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.train_outlined,
                color: MyColor.myWhite,
              ),
              title: Text('Order', style: TextStyle(color: MyColor.myWhite)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.notification_important_rounded,
                color: MyColor.myWhite,
              ),
              title: Text('Notification',
                  style: TextStyle(color: MyColor.myWhite)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: MyColor.myWhite,
              ),
              title: Text('Sitting', style: TextStyle(color: MyColor.myWhite)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: MyColor.myWhite, // Line color
              thickness: 1.0, // Line thickness
              indent: 16.0, // Left indentation
              endIndent: 16.0, // Right indentation
            ),
            ListTile(
              leading: Icon(color: MyColor.myWhite, Icons.logout),
              title: Text('Sign Out', style: TextStyle(color: MyColor.myWhite)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: GetBuilder<HomeController>(
        builder: (homeController) {
          return  CurvedNavigationBar(
            index: homeController.selectedIndex,
            height: 60.0,
            backgroundColor: Colors.transparent,
            color: Colors.green,
            buttonBackgroundColor: Colors.white,
            animationDuration: Duration(milliseconds: 300),
            onTap: (index) {
              homeController.updateIndex(index); // Update the index
              switch (index) {
                case 0:
                  Get.offNamed('/HomeScreen'); // Navigate to Home Screen
                  break;
                case 1:
                  Get.offNamed('/HomeScreen'); // Navigate to Favorite Screen
                  break;
                case 2:
                  Get.offNamed('/MyCartScreen'); // Navigate to My Cart Screen
                  break;
                case 3:
                  Get.offNamed('/DetailsScreen'); // Navigate to Details Screen
                  break;
                case 4:
                  Get.offNamed('/ProfileScreen'); // Navigate to Profile Screen
                  break;
              }
            },
            items: <Widget>[
              Icon(
                Icons.home,
                color: homeController.selectedIndex == 0 ? MyColor.basicGreen : MyColor.myWhite,
              ),
              Icon(
                Icons.favorite,
                color: homeController.selectedIndex == 1 ? MyColor.basicGreen : MyColor.myWhite,
              ),
              Icon(
                Icons.shopping_cart,
                color: homeController.selectedIndex == 2 ? MyColor.basicGreen : MyColor.myWhite,
              ),
              Icon(
                Icons.notifications,
                color: homeController.selectedIndex == 3 ? MyColor.basicGreen : MyColor.myWhite,
              ),
              Icon(
                Icons.person,
                color: homeController.selectedIndex == 4 ? MyColor.basicGreen : MyColor.myWhite,
              ),
            ],
          );



        },
      ),
    );
  }
}

void _onItemTapped(int index, HomeController homeController) {
  homeController.changeIndex(index);
}
