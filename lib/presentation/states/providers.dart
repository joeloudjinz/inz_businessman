import 'package:businessman/presentation/states/localization_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Providers {
  static final localization = ChangeNotifierProvider((ref) => LocalizationState());
}