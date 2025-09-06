import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_online_sat/core/resources/assets_manager.dart';
import 'package:islami_app_online_sat/core/resources/colors_manager.dart';
import 'package:islami_app_online_sat/models/hadith_model.dart';

class HadithItem extends StatefulWidget {
  const HadithItem({super.key, required this.index});

  final int index;

  @override
  State<HadithItem> createState() => _HadithItemState();
}

class _HadithItemState extends State<HadithItem> {
  HadithModel? hadith;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadithContent(widget.index);

    /// blocking
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12, left: 8, right: 8),
      margin: EdgeInsets.only(bottom: 20),

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.hadithCardBgImage),
        ),
        color: ColorsManager.gold,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    ImageAssets.suraDetailsPatternLeft,
                    color: Colors.black,
                  ),
                  Image.asset(
                    ImageAssets.suraDetailsPatternRight,
                    color: Colors.black,
                  ),
                ],
              ),
              Text(
                hadith?.title ?? "",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.black,
                ),
              ),
            ],
          ),
          Expanded(
            child: hadith == null
                ? Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.black,
                    ),
                  )
                : SingleChildScrollView(
                    child: Text(
                      hadith!.content,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.black,
                      ),
                    ),
                  ),
          ),
          Image.asset(ImageAssets.hadithCardBottomImage),
        ],
      ),
    );
  }


  void loadHadithContent(int index)async {
    String filePath = "assets/files/hadith/h$index.txt";
    String hadithContent = await rootBundle.loadString(filePath);
  List<String> hadithLines = hadithContent.trim().split("\n");
  String title = hadithLines[0];
  hadithLines.removeAt(0);
  String content = hadithLines.join();
  await Future.delayed(Duration(seconds: 1),);
  hadith = HadithModel(title: title, content: content);

    setState(() {

    });

  }

  // void loadHadithContent(int index) {
  //   String filePath = "assets/files/hadith/h$index.txt";
  //
  // rootBundle.loadString(filePath).then((fileContent){
  //   List<String> hadithLines = fileContent.trim().split("\n");
  //   String title = hadithLines[0];
  //   hadithLines.removeAt(0);
  //   String content = hadithLines.join();
  //   Future.delayed(Duration(seconds: 1), ).then((_){
  //     hadith = HadithModel(title: title, content: content);
  //     setState(() {
  //
  //     });
  //   });
  //
  // });
  // }
}
