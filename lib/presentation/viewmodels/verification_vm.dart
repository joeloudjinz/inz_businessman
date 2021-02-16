import 'package:businessman/presentation/states/phone_verification_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodeVerificationViewModel {
  final provider = ChangeNotifierProvider((reg) => PhoneVerificationState());
}
