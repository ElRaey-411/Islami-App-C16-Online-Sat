import 'package:flutter/cupertino.dart';
import 'package:islami_app_online_sat/features/main_layout/main_layout.dart';
import 'package:islami_app_online_sat/features/splash/splash_screen.dart';
import 'package:islami_app_online_sat/features/sura_detals/sura_details.dart';
import '../../features/on_boarding/on_boarding.dart';

class RoutesManager {
  static const String splash = "/splash";
  static const String onBoarding = "/onBoarding";
  static const String mainLayout = "/mainLayout";
  static const String suraDetails = "/suraDetails";

  static Map<String, WidgetBuilder> routes = {
    splash:(context)=> SplashScreen(),
    mainLayout:(context)=> MainLayout(),
    suraDetails : (context)=>SuraDetails(),
    onBoarding : (context)=>OnBoarding(),
  };
}