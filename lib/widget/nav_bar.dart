// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import '../../../core/constances/all_colors.dart';
// import '../view/home/screen/home_screen.dart';
//
// class MyNavBar extends StatefulWidget {
//   @override
//   _MyNavBarState createState() => _MyNavBarState();
// }
//
// class _MyNavBarState extends State<MyNavBar> {
//   int _selectedIndex = 2;
//
//   // List of pages for navigation
//   final List<Widget> _pages = [
//     HomeScreen(), // Home Screen
//     Center(child: Text("Favorites Page")),
//     Center(child: Text("Cart Page")),
//     Center(child: Text("Notifications Page")),
//     Center(child: Text("Profile Page")),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Widget(
//       bottomNavigationBar: CurvedNavigationBar(
//         index: _selectedIndex,
//         height: 60.0,
//         backgroundColor: Colors.transparent,
//         color: MyColor.myWhite,
//         buttonBackgroundColor: MyColor.basicGreen,
//         animationDuration: Duration(milliseconds: 300),
//         onTap: _onItemTapped,
//         items: <Widget>[
//           Icon(Icons.home, color: _selectedIndex == 0 ? MyColor.myWhite : MyColor.myGray),
//           Icon(Icons.favorite, color: _selectedIndex == 1 ? MyColor.myWhite : MyColor.myGray),
//           Icon(Icons.shopping_bag, color: _selectedIndex == 2 ? MyColor.myWhite : MyColor.myGray),
//           Icon(Icons.notifications, color: _selectedIndex == 3 ? MyColor.myWhite : MyColor.myGray),
//           Icon(Icons.person, color: _selectedIndex == 4 ? MyColor.myWhite : MyColor.myGray),
//         ],
//       ),
//       body: _pages[_selectedIndex], // Display the selected page
//     );
//   }
// }
