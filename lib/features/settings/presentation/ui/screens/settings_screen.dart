import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:atest/common/common.dart';
import 'package:atest/features/features.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      smallScreen: SettingsScreenSmall(),
      largeScreen: SettingsScreenLarge(),
    );
  }
}
