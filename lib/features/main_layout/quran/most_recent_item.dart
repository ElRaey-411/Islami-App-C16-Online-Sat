import 'package:flutter/material.dart';
import 'package:islami_app_online_sat/core/resources/assets_manager.dart';
import 'package:islami_app_online_sat/core/resources/colors_manager.dart';
import 'package:islami_app_online_sat/models/sura_model.dart';

class MostRecentItem extends StatelessWidget {
   MostRecentItem({super.key, required this.sura});
  SuraModel sura;

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
              Text(sura.suraNameEn, style: TextStyle(fontSize: 24, color: ColorsManager.black, fontWeight: FontWeight.bold
              ),),
              Text(sura.suraNameAr, style: TextStyle(fontSize: 24, color: ColorsManager.black, fontWeight: FontWeight.bold
              ),),
              Text("${sura.versesNum} Verses ", style: TextStyle(fontSize: 14, color: ColorsManager.black, fontWeight: FontWeight.bold
              ),),
            ],
          ),
          Image.asset(ImageAssets.mostRecentCardImage)
        ],
      ),
    );
  }
}
