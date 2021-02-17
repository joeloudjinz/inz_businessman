import 'package:businessman/core/generated/locator.dart';
import 'package:businessman/lang/localization.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            InzLocalizations.of(context).splashScreenTitle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  locator<NavigationService>().navigateTo("/login-screen");
                },
                child: const Icon(Icons.arrow_right_rounded),
              ),
            ],
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
