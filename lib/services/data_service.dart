import 'package:shared_preferences/shared_preferences.dart';

class DataService {
  static void setData(List<String> data) {
    SharedPreferences.getInstance().then((prefs) async {
      List<String> m = prefs.getStringList("names") ?? [];
      m.addAll(data);
      prefs.setStringList("names", m).then((value) {
        print("Names saved");
      });
    });
  }
}
