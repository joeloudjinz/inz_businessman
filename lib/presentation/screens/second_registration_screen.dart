import 'package:businessman/core/generated/locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class SecondRegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('final registration screen'),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  locator<NavigationService>().back();
                },
                child: Icon(Icons.arrow_left_rounded),
              ),
              ElevatedButton(
                onPressed: () {
                  locator<NavigationService>().navigateTo("/home-screen");
                },
                child: Icon(Icons.arrow_right_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
