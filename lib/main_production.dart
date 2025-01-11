import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_egypt/go_egypt_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize localization in the app
  await EasyLocalization.ensureInitialized();
  runApp(
    //use "EasyLocalization" to let the app supports both Arabic and English languages
    EasyLocalization(
      //define supported languages
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/languages',
      //set default language of the app
      fallbackLocale: const Locale('en', 'US'),
      child: const GoEgyptApp(),
    ),
  );
}
