import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_egypt/features/layout/layout_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt/core/core_cubits/language_cubit.dart';

class GoEgyptApp extends StatelessWidget {
  const GoEgyptApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp(
            //to make the app able to be translated into different languages
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            //tell the app to be translated in the current selected language
            locale: locale,
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
                selectedIconTheme:
                    IconThemeData(color: Colors.deepPurple, size: 28),
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
            home: LayoutView(),
          );
        },
      ),
    );
  }
}
