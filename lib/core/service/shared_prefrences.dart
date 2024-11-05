import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyService extends GetxService{
  late SharedPreferences sharedPrefrences;
  Future<MyService> init()async{
    sharedPrefrences =await SharedPreferences.getInstance();
    return this;
  }
}
initialService()async{
  await Get.putAsync(() => MyService().init());
}