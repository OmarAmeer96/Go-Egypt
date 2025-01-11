import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_egypt/features/auth/views/sign_up_page.dart';

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
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //to make the app able to be translated into different languages
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      //tell the app to be translated in the current selected language
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepPurple,
          selectedLabelStyle: TextStyle(
            color: Colors.deepPurple,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          selectedIconTheme: IconThemeData(color: Colors.deepPurple, size: 28),
          unselectedItemColor: Colors.grey,
          unselectedIconTheme: IconThemeData(
            color: Colors.grey.shade400,
            size: 24,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
          elevation: 10,
          showUnselectedLabels: true,
          showSelectedLabels: true,
        ),
      ),
      home: SignUpPage(),
    );
  }
}
