import 'package:flutter/material.dart';
import 'package:islami_app_online_sat/core/resources/assets_manager.dart';
import 'package:islami_app_online_sat/core/resources/colors_manager.dart';
import 'package:islami_app_online_sat/core/resources/constant_manager.dart';
import 'package:islami_app_online_sat/core/routes_manager/routes_manager.dart';
import 'package:islami_app_online_sat/models/sura_model.dart';

class SuraItem extends StatelessWidget {
  const SuraItem({super.key, required this.sura});
final SuraModel sura;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, RoutesManager.suraDetails,arguments: sura);
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
