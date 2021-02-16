import 'package:businessman/presentation/viewmodels/login_vm.dart';
import 'package:businessman/presentation/viewmodels/phone_registration_vm.dart';
import 'package:businessman/presentation/viewmodels/phone_verification_vm.dart';
import 'package:businessman/presentation/viewmodels/second_registration_vm.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ViewModelsModule {
  @LazySingleton()
  LoginViewModel get loginViewModel;

  @LazySingleton()
  PhoneRegistrationViewModel get phoneRegistrationViewModel;

  @LazySingleton()
  PhoneVerificationViewModel get codeVerificationViewModel;

  @LazySingleton()
  SecondRegistrationViewModel get secondRegistrationViewModel;
}
