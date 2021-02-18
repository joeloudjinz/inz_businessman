import 'package:flutter/material.dart';

/// Adds scrollable functionality with a symmetric padding of 16
/// horizontally to the scaffold widget.
class ScaffoldBodyHolder extends StatelessWidget {
  final Widget child;

  const ScaffoldBodyHolder({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: child,
            ),
          );
        },
      ),
    );
  }
}
