// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../presentation/viewmodels/verification_vm.dart';
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
  gh.lazySingleton<CodeVerificationViewModel>(
      () => viewModelsModule.codeVerificationViewModel);
  gh.lazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  return get;
}

class _$ViewModelsModule extends ViewModelsModule {
  @override
  CodeVerificationViewModel get codeVerificationViewModel =>
      CodeVerificationViewModel();
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  NavigationService get navigationService => NavigationService();
}
