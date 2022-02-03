import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burguer_mobile/app/core/services/shopping_card_service.dart';

class AplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RestClient(),
      fenix: true, //utilizado para manter na aplicação, ele nunca vai morrer
    );
    Get.lazyPut(
      () =>
          ShoppingCardService(), //como é um service não precisa da fenix, ele não vai morrer nunca na aplicação
    );
  }
}
