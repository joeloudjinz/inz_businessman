import 'package:businessman/core/generated/locator.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart' as AutoRouter;
import 'package:businessman/core/generated/router.gr.dart' as AppRouter;
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Businessman gate to enter Tidikelt mega market',
      builder: AutoRouter.ExtendedNavigator.builder<AppRouter.Router>(
        router: AppRouter.Router(),
        initialRoute: AppRouter.Routes.splashScreen,
        navigatorKey: StackedService.navigatorKey,
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
