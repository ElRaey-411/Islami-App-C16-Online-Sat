import 'package:flutter/material.dart';
import 'package:islami_app_online_sat/core/resources/assets_manager.dart';
import 'package:islami_app_online_sat/core/resources/colors_manager.dart';
import 'package:islami_app_online_sat/core/resources/constant_manager.dart';
import 'package:islami_app_online_sat/core/routes_manager/routes_manager.dart';
import 'package:islami_app_online_sat/features/main_layout/quran/most_recent_suras.dart';
import 'package:islami_app_online_sat/features/main_layout/quran/quran_tab.dart';
import 'package:islami_app_online_sat/models/most_recent.dart';
import 'package:islami_app_online_sat/models/sura_model.dart';

class SuraItem extends StatelessWidget {
  const SuraItem({super.key, required this.sura, required this.mostRecentKey});
final SuraModel sura;
final GlobalKey<MostRecentSurasState> mostRecentKey;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

        MostRecent.addMostRecent(sura);
        Navigator.pushNamed(context, RoutesManager.suraDetails,arguments:SuraDetailsArguments(sura: sura, mostRecentKey: mostRecentKey));
      },

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(ImageAssets.suraNumberBg),
                Text(
                  sura.suraIndex,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.white,
                  ),
                ),
              ],
            ),
            SizedBox(width: 24,),
            Column(
              children: [
                Text(
                 sura.suraNameEn,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.white,
                  ),
                ),

                Text(
                 sura.versesNum,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.white,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
             sura.suraNameAr,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorsManager.white,
              ),
            ),


          ],
        ),
      ),
    );
  }
}


class SuraDetailsArguments{
  SuraModel sura;
  GlobalKey<MostRecentSurasState>mostRecentKey;
  SuraDetailsArguments({required this.sura, required this.mostRecentKey});
}
