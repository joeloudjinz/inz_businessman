import 'package:businessman/presentation/viewmodels/verification_vm.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ViewModelsModule {
  @LazySingleton()
  CodeVerificationViewModel get codeVerificationViewModel;
}
