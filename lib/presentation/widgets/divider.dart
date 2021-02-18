import 'package:businessman/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      color: CustomColors.dark,
    );
  }
}
