import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app_online_sat/core/resources/colors_manager.dart';
import 'package:islami_app_online_sat/features/on_boarding/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/resources/assets_manager.dart';
import '../../core/routes_manager/routes_manager.dart';

class OnBoarding extends StatelessWidget {
  List<Pages> pages = [
    Pages(
      bodyImage: ImageAssets.onboardingWelcome,
      subtitle: "Welcome To Islami App",
    ),
    Pages(
      bodyImage: ImageAssets.onboardingMosque,
      subtitle: "Welcome To Islami",
      description: "We Are Very Excited To Have You In Our\n Community",
    ),
    Pages(
      bodyImage: ImageAssets.onboardingQuraan,
      subtitle: "Reading the Quran",
      description: " Read, and your Lord is the Most Generous",
    ),
    Pages(
      bodyImage: ImageAssets.onboardingDuaa,
      subtitle: "Bearish",
      description: "Praise the name of your Lord, the Most\nHigh",
    ),
    Pages(
      bodyImage: ImageAssets.onboardingRadio,
      subtitle: "Holy Quran Radio",
      description: "You can listen to the Holy Quran Radio\nthrough the application for free and easily",
    ),

  ];

  Future<void> _completeOnBoarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("onboarding_done", true);
    Navigator.pushReplacementNamed(context,RoutesManager.mainLayout );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: pages.map((p) => p.toPageViewModel()).toList(),
      onDone: () {
        _completeOnBoarding(context);
      },
      onSkip: () {
        _completeOnBoarding(context);
      },
      showSkipButton: true,
      skip:  Text("Skip", style: TextStyle(fontWeight: FontWeight.w600,color: ColorsManager.gold)),
      next:  Icon(Icons.arrow_forward,color: ColorsManager.gold),
      done:  Text("Done", style: TextStyle(fontWeight: FontWeight.w600,color: ColorsManager.gold)),
      dotsDecorator:  DotsDecorator(
        size: Size(10.0, 10.0),
        activeColor: ColorsManager.gold,
        color: ColorsManager.ofWhite,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
    );

  }
}
