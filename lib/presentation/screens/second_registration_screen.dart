import 'package:businessman/core/generated/locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class SecondRegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('final registration screen'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  locator<NavigationService>().back();
                },
                child: const Icon(Icons.arrow_left_rounded),
              ),
              ElevatedButton(
                onPressed: () {
                  locator<NavigationService>().navigateTo("/home-screen");
                },
                child: const Icon(Icons.arrow_right_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
