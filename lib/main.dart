import 'package:flutter/material.dart';
import 'package:velorant/routes/route_generator.dart';
import 'package:velorant/routes/route_navigation.dart';
import 'package:velorant/app_theme/app_theme.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: RouteNavigation.instance.navigationKey,
    );
  }
}