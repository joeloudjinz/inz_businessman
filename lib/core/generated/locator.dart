import 'package:businessman/core/generated/locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final locator = GetIt.instance;

@injectableInit
void setupLocator() => $initGetIt(locator);
