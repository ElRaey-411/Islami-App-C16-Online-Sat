import 'package:flutter/material.dart';
import 'package:islami_app_online_sat/config/theme/theme_manager.dart';
import 'package:islami_app_online_sat/core/extensions/context_extensions.dart';
import 'package:islami_app_online_sat/core/resources/colors_manager.dart';
import 'package:islami_app_online_sat/core/routes_manager/routes_manager.dart';

void main(){

  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeManager.light,
      darkTheme: ThemeManager.dark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routes: RoutesManager.routes,
      initialRoute: RoutesManager.splash,
    );
  }
}
