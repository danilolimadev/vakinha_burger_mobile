import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/modules/splash/splash_controller.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}