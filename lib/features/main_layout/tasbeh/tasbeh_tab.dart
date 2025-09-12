import 'package:flutter/material.dart';
import 'package:islami_app_online_sat/core/resources/colors_manager.dart';
import 'package:islami_app_online_sat/features/main_layout/tasbeh/sebha_item.dart';

import '../../../core/resources/assets_manager.dart';

class TasbehTab extends StatefulWidget {
  static double sebhaAngle = 0;

  static int duaa2Counter = 0;
  static int counter = 0;
  static String duaa2Text = "سبحان الله";

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  void onTasbeh() {
    setState(() {
      TasbehTab.sebhaAngle += 0.1903030303030303;
      TasbehTab.counter++;
      TasbehTab.duaa2Counter++;
      switch (TasbehTab.counter) {
        case 33:
          TasbehTab.duaa2Counter = 0;
          TasbehTab.duaa2Text = "الحمدالله";
          break;
        case 66:
          TasbehTab.duaa2Counter = 0;
          TasbehTab.duaa2Text = "لا اله الا الله";
          break;
        case 99:
          TasbehTab.duaa2Counter = 0;
          TasbehTab.counter = 0;
          TasbehTab.duaa2Text = "سبحان الله";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          ImageAssets.tasbehBg,
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                ColorsManager.black,
                ColorsManager.black.withValues(alpha: .7),
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(ImageAssets.islamiLogo),
            Image.asset(ImageAssets.tasbehSubtitle),
            SebhaItem(onTasbeh: onTasbeh),
          ],
        ),
      ],
    );
  }
}
