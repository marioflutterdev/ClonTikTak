import 'package:intl/intl.dart';

class HumanFormats {
  static String humanReadbleNumber(double value) {
    final fometterNumber =
        NumberFormat.compactCurrency(decimalDigits: 0, symbol: '')
            .format(value);

    return fometterNumber;
  }
}
