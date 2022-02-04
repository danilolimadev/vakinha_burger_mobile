import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/models/product_model.dart';
import 'package:vakinha_burguer_mobile/app/models/shopping_card_model.dart';

class ShoppingCardService extends GetxService {
  final _shoppingCard = <int, ShoppingCardModel>{}.obs;

  List<ShoppingCardModel> get products => _shoppingCard.values.toList();

  int get totalProducts => _shoppingCard.values.length;

  ShoppingCardModel? getById(int id) => _shoppingCard[id];

  double get totalValue {
    return _shoppingCard.values.fold(0, (totalValue, shoppingCardModel) {
      totalValue += shoppingCardModel.product.price * shoppingCardModel.quantity;
      return totalValue;
    });
  }

  void addAndRemoveProductInShoppingCard(
    ProductModel product, {
    required int quantity,
  }) {
    if (quantity == 0) {
      _shoppingCard.remove(product.id);
    } else {
      _shoppingCard.update(product.id, (product) {
        product.quantity = quantity;
        return product;
      }, ifAbsent: () {
        //caso não exista algo antes na lista, executa essa função
        return ShoppingCardModel(quantity: quantity, product: product);
      });
    }
  }

  void clear() => _shoppingCard.clear();
}
