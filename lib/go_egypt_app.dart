import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt/core/core_cubits/language_cubit.dart';
import 'package:go_egypt/core/helpers/build_bottom_nav_bar.dart';
import 'package:go_egypt/features/layout/layout_view.dart';
import 'package:go_egypt/generated/l10n.dart';

class GoEgyptApp extends StatelessWidget {
  const GoEgyptApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp(
            // ------------- Localization -------------
            locale: locale,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            // ------------- Localization -------------
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              bottomNavigationBarTheme: buildBottomNavBar(),
            ),
            // home: SignUpPage(),
            home: LayoutView(),
          );
        },
      ),
    );
  }
}
