import 'package:businessman/core/generated/locator.dart';
import 'package:businessman/presentation/widgets/scrollable_scaffold_body.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScaffoldBodyHolder(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('home screen'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    locator<NavigationService>().back();
                  },
                  child: const Icon(Icons.arrow_left_rounded),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
