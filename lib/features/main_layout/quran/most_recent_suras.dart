import 'package:flutter/material.dart';
import 'package:islami_app_online_sat/core/extensions/context_extensions.dart';
import 'package:islami_app_online_sat/models/most_recent.dart';
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
    mostRecentSuras = MostRecent.getMostRecentSuras();
    await Future.delayed(Duration(seconds: 1));
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
    return SizedBox(
      height: context.getHeight * 0.17,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 8),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            MostRecentItem(sura: MostRecent.mostRecentSuras[index]),
        itemCount: MostRecent.mostRecentSuras.length,
      ),
    );
  }
}
