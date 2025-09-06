import 'package:flutter/material.dart';

import '../../core/resources/colors_manager.dart';

class VerseItem extends StatelessWidget {
   VerseItem({super.key, required this.verse});
String verse;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 30,
      color: ColorsManager.gold.withOpacity(0.7),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
         verse,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: ColorsManager.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
