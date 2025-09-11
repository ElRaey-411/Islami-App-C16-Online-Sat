import 'package:flutter/material.dart';
import 'package:islami_app_online_sat/features/main_layout/tasbeh/tasbeh_tab.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/colors_manager.dart';

class SebhaItem extends StatefulWidget {
  SebhaItem({ required this.onTasbeh});

  Function onTasbeh;

  @override
  State<SebhaItem> createState() => _SebhaItemState();
}

class _SebhaItemState extends State<SebhaItem> {
  @override
  Widget build(BuildContext context) =>
      Container(
        alignment: Alignment.center,
        child: Stack(
            children: [
              InkWell(
                onTap: () {
                  widget.onTasbeh();
                },
                child: Transform.rotate(angle: TasbehTab.sebhaAngle,
                    child: Image.asset(ImageAssets.sebha,)
                ),
              ),
              Positioned(
                bottom: 140,
                right: 110,
                child: Column(
                    children: [
                      Text(TasbehTab.duaa2Text, style: TextStyle(fontSize: 36,
                          color: ColorsManager.white,
                          fontWeight: FontWeight.bold)),
                      Text("${TasbehTab.duaa2Counter}", style: TextStyle(
                          fontSize: 36,
                          color: ColorsManager.white,
                          fontWeight: FontWeight.bold)),
                    ]
                ),
              ),

            ]
        ),
      );
}
