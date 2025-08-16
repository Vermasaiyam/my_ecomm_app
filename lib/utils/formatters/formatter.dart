import 'package:intl/intl.dart';

class TFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_IN', symbol: '₹').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    String cleanedNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');
    if (cleanedNumber.length == 10) {
      return '+91 ${cleanedNumber.substring(0, 5)} ${cleanedNumber.substring(5)}';
    }
    return phoneNumber;
  }

  static String internationalFormatPhoneNumber(String phoneNumber) {
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    String countryCode = digitsOnly.substring(0, 2);
    String number = digitsOnly.substring(2);

    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode) ');

    int i = 0;
    while (i < number.length) {
      int groupLength = 2;
      int end = i + groupLength;
      formattedNumber.write(number.substring(i, end));
      i = end;

      if (i < number.length) {
        formattedNumber.write(' ');
      }
    }
    return formattedNumber.toString();
  }
}