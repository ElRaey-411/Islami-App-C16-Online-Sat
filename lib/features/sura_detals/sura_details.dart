import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_online_sat/core/resources/assets_manager.dart';
import 'package:islami_app_online_sat/core/resources/colors_manager.dart';
import 'package:islami_app_online_sat/features/sura_detals/verse_item.dart';
import 'package:islami_app_online_sat/models/sura_model.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late SuraModel suraArguments;
  List<String> verses = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    suraArguments = ModalRoute.of(context)?.settings.arguments as SuraModel;
    loadSuraContent(suraArguments.suraIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(suraArguments.suraNameEn)),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(ImageAssets.suraDetailsPatternLeft),
                  Image.asset(ImageAssets.suraDetailsPatternRight),
                ],
              ),
              Text(
                suraArguments.suraNameAr,
                style: TextStyle(
                  color: ColorsManager.gold,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Expanded(
            child: verses.isEmpty
                ? Center(
                    child: CircularProgressIndicator(color: ColorsManager.gold),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) =>
                        VerseItem(verse: verses[index]),
                    itemCount: verses.length,
                  ),
          ),
        ],
      ),
    );
  }

  void loadSuraContent(String suraIndex) async {
    print("infinite");
    String filePath = "assets/files/suras/$suraIndex.txt";
    String fileContent = await rootBundle.loadString(filePath); // 10 secs
    List<String> suraLines = fileContent.trim().split("\n");
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += "[${i + 1}]";
    }
   await  Future.delayed(Duration(seconds: 1),);
    setState(() {
      verses = suraLines;
    });
  }

  // void test(){
  //  String name = stdin.readLineSync()!; /// blocking
  //  print("Hello");
  // }
}
