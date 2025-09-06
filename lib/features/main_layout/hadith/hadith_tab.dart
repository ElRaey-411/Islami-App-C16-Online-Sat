import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' ;
import 'package:islami_app_online_sat/core/resources/assets_manager.dart';

import 'hadith_item.dart';

class HadithTab extends StatelessWidget {
  const HadithTab({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(ImageAssets.hadithTabBg))
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(ImageAssets.islamiLogo),
         // SizedBox(height: 65,),
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                height: double.infinity,
              enlargeCenterPage: true,
                enlargeFactor: .2,
                //autoPlay: true,
                viewportFraction: .8,
            
              ),
              items: List.generate(50, (index)=>index+1).map((index) {
                return HadithItem(index: index,);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
