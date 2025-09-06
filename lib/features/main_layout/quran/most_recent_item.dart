import 'package:flutter/material.dart';
import 'package:islami_app_online_sat/core/resources/assets_manager.dart';
import 'package:islami_app_online_sat/core/resources/colors_manager.dart';

class MostRecentItem extends StatelessWidget {
  const MostRecentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: ColorsManager.gold,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Al-Fatiha", style: TextStyle(fontSize: 24, color: ColorsManager.black, fontWeight: FontWeight.bold
              ),),
              Text("الفاتحه", style: TextStyle(fontSize: 24, color: ColorsManager.black, fontWeight: FontWeight.bold
              ),),
              Text("7 Verses ", style: TextStyle(fontSize: 14, color: ColorsManager.black, fontWeight: FontWeight.bold
              ),),
            ],
          ),
          Image.asset(ImageAssets.mostRecentCardImage)
        ],
      ),
    );
  }
}
