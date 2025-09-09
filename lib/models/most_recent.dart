import 'package:islami_app_online_sat/models/sura_model.dart';

class MostRecent{
 static List<SuraModel> mostRecentSuras = [];
 static void addMostRecent(SuraModel suraModel){
    mostRecentSuras.add(suraModel);

  }

  static List<SuraModel> getMostRecentSuras(){
   return mostRecentSuras;
 }
}