import 'package:get/get.dart';
import '../../view/home/screen/home_screen.dart';


class AppRoutes {
  static const homeScreen = '/HomeScreen';

  static final routes = [
    GetPage(name: homeScreen, page: () => HomeScreen()),
  ];
}
