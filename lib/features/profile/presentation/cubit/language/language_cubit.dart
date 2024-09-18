import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class LanguageCubit extends HydratedCubit<Locale> {
  LanguageCubit() : super(const Locale('en')); // Default locale
  Locale selectedLanguage = const Locale('en');

  void changeLanguage(Locale locale) {
    selectedLanguage = locale;
    emit(locale);
  }

  @override
  Locale? fromJson(Map<String, dynamic> json) {
    try {
      final languageCode = json['languageCode'] as String;
      final countryCode = json['countryCode'] as String?;
      return Locale(languageCode, countryCode);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(Locale state) {
    return {
      'languageCode': state.languageCode,
      'countryCode': state.countryCode,
    };
  }
}
