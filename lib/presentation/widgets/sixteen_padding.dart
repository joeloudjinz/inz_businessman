import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SixteenPadding extends StatelessWidget {
  final Widget child;

  const SixteenPadding({@required this.child});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: child,
      );
}
