// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../presentation/viewmodels/login_vm.dart';
import '../../presentation/viewmodels/phone_registration_vm.dart';
import '../../presentation/viewmodels/phone_verification_vm.dart';
import '../../presentation/viewmodels/second_registration_vm.dart';
import '../modules/third_party_services.dart';
import '../modules/viewmodels_module.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final viewModelsModule = _$ViewModelsModule();
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<LoginViewModel>(() => viewModelsModule.loginViewModel);
  gh.lazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.lazySingleton<PhoneRegistrationViewModel>(
      () => viewModelsModule.phoneRegistrationViewModel);
  gh.lazySingleton<PhoneVerificationViewModel>(
      () => viewModelsModule.codeVerificationViewModel);
  gh.lazySingleton<SecondRegistrationViewModel>(
      () => viewModelsModule.secondRegistrationViewModel);
  return get;
}

class _$ViewModelsModule extends ViewModelsModule {
  @override
  LoginViewModel get loginViewModel => LoginViewModel();
  @override
  PhoneRegistrationViewModel get phoneRegistrationViewModel =>
      PhoneRegistrationViewModel();
  @override
  PhoneVerificationViewModel get codeVerificationViewModel =>
      PhoneVerificationViewModel();
  @override
  SecondRegistrationViewModel get secondRegistrationViewModel =>
      SecondRegistrationViewModel();
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  NavigationService get navigationService => NavigationService();
}
