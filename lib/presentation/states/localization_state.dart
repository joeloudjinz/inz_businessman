import 'package:flutter/widgets.dart';

class LocalizationState extends ChangeNotifier {
  String current = 'ar';

  toArabic() {
    current = 'ar';
    print('ar');
    notifyListeners();
  }

  toFrench() {
    current = 'fr';
    print('fr');

    notifyListeners();
  }

  toEnglish() {
    current = 'en';
    print('en');

    notifyListeners();
  }
}
