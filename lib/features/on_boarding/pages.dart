import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../core/resources/assets_manager.dart';
import '../../core/resources/colors_manager.dart';

class Pages {
  Pages({
    required this.bodyImage,
    required this.subtitle,
    this.description = "",
  });

  final String bodyImage;
  final String subtitle;
  final String description;

  PageViewModel toPageViewModel() {
    return PageViewModel(
      title: "",
      bodyWidget: Column(
        children: [
          Image.asset(ImageAssets.islamiLogo),
          SizedBox(height: 50),
          Image.asset(bodyImage),
          SizedBox(height: 40),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ColorsManager.gold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            description,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorsManager.gold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
