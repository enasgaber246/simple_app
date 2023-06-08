
import 'package:flutter/material.dart';
import 'package:simple_base_project/simple_app.dart';
import 'package:simple_base_project/utils/shared_prefs/shared_prefs.dart';


var locale;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? lang = await SharedPrefs().getAppLang();
  locale = Locale(lang!);

  String token = (await SharedPrefs().getUserDataToken()) ?? '';
  print('AccessToken token :  $token');

  runApp(SimpleApp(locale: locale));
}
