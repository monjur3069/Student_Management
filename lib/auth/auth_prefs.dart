
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> setValueForTheme(bool status) async{
  final prefs = await SharedPreferences.getInstance();
  print('status is $status');
  return prefs.setBool('isValueForTheme', status);
}

Future<bool> getValueForTheme() async{
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isValueForTheme') ?? true;
}

Future<bool> setValueForLanguage(bool status) async{
  final prefs = await SharedPreferences.getInstance();
  print('status is $status');
  return prefs.setBool('isValueForLanguage', status);
}

Future<bool> getValueForLanguage() async{
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isValueForLanguage') ?? false;
}