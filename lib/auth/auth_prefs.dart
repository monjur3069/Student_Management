
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> setValueForThemeStatus(bool status) async{
  final prefs = await SharedPreferences.getInstance();
  return prefs.setBool('isLoggedIn', status);
}

Future<bool> getValueForThemeStatus() async{
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}