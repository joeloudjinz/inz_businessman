import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EightPadding extends StatelessWidget {
  Widget child;

  EightPadding({
    @required this.child
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: child,
  );
}
