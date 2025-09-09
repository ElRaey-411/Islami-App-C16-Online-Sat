import 'package:flutter/material.dart';
import 'package:islami_app_online_sat/core/extensions/context_extensions.dart';
import 'package:islami_app_online_sat/core/prefs_manager/prefs_manager.dart';
import 'package:islami_app_online_sat/core/resources/colors_manager.dart';
import 'package:islami_app_online_sat/models/sura_model.dart';

import 'most_recent_item.dart';

class MostRecentSuras extends StatefulWidget {
  const MostRecentSuras({super.key});

  @override
  State<MostRecentSuras> createState() => MostRecentSurasState();
}

class MostRecentSurasState extends State<MostRecentSuras> {
 List<SuraModel> mostRecentSuras = [];

  void fetchMostRecent() async{
    mostRecentSuras = await PrefsManager.getMostRecentSuras();
    setState(() {

    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMostRecent();

  }
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: mostRecentSuras.isEmpty ? false : true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Most Recently",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ColorsManager.ofWhite,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: context.getHeight * 0.17,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 8),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  MostRecentItem(sura: mostRecentSuras[index],mostRecentKey: widget.key as GlobalKey<MostRecentSurasState>,),
              itemCount:mostRecentSuras.length,
            ),
          ),
        ],
      ),
    );
  }
}
