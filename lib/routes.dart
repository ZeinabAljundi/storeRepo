import 'package:get/get.dart';
import 'package:storapplication/view/details/screen/details_screen.dart';
import 'package:storapplication/view/favorite/screen/favorite_screen.dart';
import 'package:storapplication/view/home/screen/home_screen.dart';
import 'package:storapplication/view/my_cart/screen/my_cart_screen.dart';
import 'package:storapplication/view/profile/screen/profile_screen.dart';
import 'package:storapplication/widget/side_menu_drawar.dart';

class AppRoutes {
  static const homeScreen = '/HomeScreen';
  static const profileScreen = '/ProfileScreen';
  static const myCartScreen = '/MyCartScreen';
  static const favoriteScreen = '/FavoritesScreen';
  static const detailsScreen = '/DetailsScreen';
  static const sideMenu = '/SideMenu';


  static final routes = [
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: detailsScreen, page: () => DetaileScreen()),
    GetPage(name: profileScreen, page: () => ProfileScreen()),
    GetPage(name: myCartScreen, page: () => CartScreen()),
    GetPage(name: favoriteScreen, page: () => FavoritesScreen()),
    GetPage(name: sideMenu, page: () => SideMenu()),

  ];
}
