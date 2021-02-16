import 'package:businessman/presentation/viewmodels/phone_verification_vm.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ViewModelsModule {
  @LazySingleton()
  PhoneVerificationViewModel get codeVerificationViewModel;
}
