
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burguer_mobile/app/core/constants/constants.dart';

class AuthService extends GetxService {
  final _isLogged = RxnBool();
  final _getStorage = GetStorage();

  Future<AuthService> init() async {
    _getStorage.listenKey(Constants.USER_KEY, (value) {
      // if(value != null) {
      //   _isLogged(true);
      // } else {
      //   _isLogged(false);
      // }
      _isLogged(value!=null);
    });
    
    ever<bool?>(_isLogged, (isLogged) {
      if(isLogged==null || !isLogged) {
        Get.offAllNamed('/auth/login');
      } else {
        Get.offAllNamed('/home');
      }
    });

    // final isLoggedData = getUserId() != null;
    _isLogged(getUserId() != null); //isso para executar logo na primeira execução
    return this;
  }

  void logout() => _getStorage.write(Constants.USER_KEY, null);

  int? getUserId() => _getStorage.read(Constants.USER_KEY);

}