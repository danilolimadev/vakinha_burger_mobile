import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/modules/splash/splash_bindings.dart';
import 'package:vakinha_burguer_mobile/app/modules/splash/splash_page.dart';

class SpashRouters {
  SpashRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/',
      binding: SplashBindings(),
      page: () => const SplashPage(),
    )
  ];
}
