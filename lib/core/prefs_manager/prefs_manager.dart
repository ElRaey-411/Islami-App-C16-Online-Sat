import 'package:islami_app_online_sat/models/sura_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  /// 2 scenarios
  static Future<void> saveSuraIndex(String suraIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentSuras =
        prefs.getStringList("most_recent_suras") ?? [];
    if(mostRecentSuras.length > 7){
      mostRecentSuras.remove(mostRecentSuras.first);
    }
    if(mostRecentSuras.contains(suraIndex)){
      mostRecentSuras.remove(suraIndex);
    }
    mostRecentSuras.add(suraIndex);
    prefs.setStringList("most_recent_suras", mostRecentSuras);
  }

  static Future<List<SuraModel>>getMostRecentSuras() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentSurasIndex =
        prefs.getStringList("most_recent_suras") ?? [];
    List<SuraModel> mostRecentSuras = [];
   // ["1", "2", "3"];
    for (int i = 0; i < mostRecentSurasIndex.length; i++) {
      int index = int.parse(mostRecentSurasIndex[i]);
      SuraModel suraModel = SuraModel.suras[index-1];
      mostRecentSuras.add(suraModel);
    }
    return mostRecentSuras.reversed.toList();
  }

  // static List<SuraModel> mostRecentSuras = [];
  // static void addMostRecent(SuraModel suraModel){
  //    mostRecentSuras.add(suraModel);
  //    /// how to cache list -> Presistant storage
  //
  //  }
  //
  //  static List<SuraModel> getMostRecentSuras(){
  //   return mostRecentSuras;
  //   /// read data from presistant storage
  // }
}
