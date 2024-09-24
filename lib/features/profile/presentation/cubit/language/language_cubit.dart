import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class LanguageState {
  final Locale selectedLanguage;

  LanguageState(this.selectedLanguage);

  Map<String, dynamic> toJson() {
    return {
      'languageCode': selectedLanguage.languageCode,
    };
  }

  static LanguageState fromJson(Map<String, dynamic> json) {
    return LanguageState(Locale(json['languageCode']));
  }
}

class LanguageCubit extends HydratedCubit<LanguageState> {
  LanguageCubit()
      : super(LanguageState(const Locale('en'))); // Default to 'en' (English)

  void changeLanguage(Locale locale) {
    emit(LanguageState(locale)); // Emit the new selected language
  }

  @override
  LanguageState fromJson(Map<String, dynamic> json) {
    return LanguageState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(LanguageState state) {
    return state.toJson();
  }
}
