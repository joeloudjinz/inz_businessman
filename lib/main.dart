import 'package:businessman/core/generated/locator.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart' as auto_router;
import 'package:businessman/core/generated/router.gr.dart' as app_router;
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
      builder: auto_router.ExtendedNavigator.builder<app_router.Router>(
        router: app_router.Router(),
        initialRoute: app_router.Routes.splashScreen,
        navigatorKey: StackedService.navigatorKey,
      ),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
