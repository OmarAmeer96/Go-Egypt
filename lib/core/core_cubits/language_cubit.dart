import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt/constants.dart';
import 'package:go_egypt/core/helpers/shared_pref_helper.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en', 'US')) {
    _loadCurrentLocale();
  }

  void _loadCurrentLocale() async {
    String? currentLocale =
        await SharedPrefHelper.getString(SharedPrefKeys.currentLocale) ?? 'en';
    if (currentLocale != null) {
      emit(Locale(currentLocale));
    }
  }

  void toggleLanguage() async {
    if (state.languageCode == 'en') {
      await saveCurrentLocale("ar");
      emit(const Locale('ar', 'EG'));
    } else {
      await saveCurrentLocale("en");
      emit(const Locale('en', 'US'));
    }
  }

  Future<void> saveCurrentLocale(String locale) async {
    await SharedPrefHelper.setData(
      SharedPrefKeys.currentLocale,
      locale,
    );
  }
}
