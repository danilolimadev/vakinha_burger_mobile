import 'package:intl/intl.dart';

class FormatterHelper {
  static final _currencyFormat = NumberFormat.currency(
    locale: 'pt_BR',
    symbol:
        r'R$', //precisa do r na frente para aceitar qualquer valor na string
  );

  FormatterHelper._();

  static String formatCurrency(double value) {
    return _currencyFormat.format(value);
  }
}
