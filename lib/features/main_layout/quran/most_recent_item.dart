import 'package:flutter/material.dart';
import 'package:islami_app_online_sat/core/prefs_manager/prefs_manager.dart';
import 'package:islami_app_online_sat/core/resources/assets_manager.dart';
import 'package:islami_app_online_sat/core/resources/colors_manager.dart';
import 'package:islami_app_online_sat/core/routes_manager/routes_manager.dart';
import 'package:islami_app_online_sat/features/main_layout/quran/most_recent_suras.dart';
import 'package:islami_app_online_sat/features/main_layout/quran/sura_item.dart';
import 'package:islami_app_online_sat/models/sura_model.dart';

class MostRecentItem extends StatelessWidget {
   MostRecentItem({super.key, required this.sura, required this.mostRecentKey});
  SuraModel sura;
  GlobalKey<MostRecentSurasState> mostRecentKey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        PrefsManager.saveSuraIndex(sura.suraIndex);
        Navigator.pushNamed(context, RoutesManager.suraDetails, arguments: SuraDetailsArguments(sura: sura, mostRecentKey: mostRecentKey));
      },
      child: Container(
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
      ),
    );
  }
}
