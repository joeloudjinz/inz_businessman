import 'package:businessman/core/generated/locator.dart';
import 'package:businessman/presentation/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart' as auto_router;
import 'package:businessman/core/generated/router.gr.dart' as app_router;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Businessman gate to enter Tidikelt mega market',
      builder: auto_router.ExtendedNavigator.builder<app_router.Router>(
        router: app_router.Router(),
        initialRoute: app_router.Routes.splashScreen,
        navigatorKey: StackedService.navigatorKey,
      ),
      theme: CustomTheme.lightTheme,
      // theme: CustomTheme.lightTheme,
      // darkTheme: CustomTheme.darkTheme,
      // themeMode: currentTheme.currentTheme,
      // theme: ThemeData(
      //   primaryColor: CustomColors.primary,
      //   // primaryColorDark: const Color(0xFF0B1320),
      //   // primaryColorLight: const Color(0xFFFEF9E6),
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
    );
  }
}
