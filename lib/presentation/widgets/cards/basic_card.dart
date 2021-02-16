import 'package:flutter/material.dart';

class BasicCard extends StatelessWidget {
  final String title;
  final String body;

  const BasicCard({this.title, this.body});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ),
            // AppDivider(),
            Text(body),
          ],
        ),
      ),
    );
  }
}
