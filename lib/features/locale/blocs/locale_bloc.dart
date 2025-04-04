import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/core/core.dart';

part 'locale_event.dart';
part 'locale_state.dart';
part 'locale_bloc.freezed.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(const _Locale(locale: Locale('en'))) {
    on<_InitialLocale>(_onInitialLocale);
    on<_EnLocale>(_onEnLocale);
    on<_YoLocale>(_onYoLocale);
  }

  /// Initial Locale
  Future<void> _onInitialLocale(
    _InitialLocale event,
    Emitter<LocaleState> emit,
  ) async {
    const en = Locale('en');
    const yo = Locale('yo');
    try {
      final storedLocale = AppStorage.getLocale();
      if (storedLocale == 'en') {
        emit(const _Locale(locale: en));
      }
      if (storedLocale == 'yo') {
        emit(const _Locale(locale: yo));
      }
    } catch (e) {
      // getCurrentLocale()
      emit(const _Locale(locale: en));
    }
  }

  /// English Locale
  Future<void> _onEnLocale(
    _EnLocale event,
    Emitter<LocaleState> emit,
  ) async {
    const en = Locale('en');
    try {
      if (state.locale != en) {
        AppStorage.saveLocale('en');
        emit(const _Locale(locale: en));
      }
    } catch (e) {
      emit(const _Locale(locale: en));
    }
  }

  /// Yoruba Locale
  Future<void> _onYoLocale(
    _YoLocale event,
    Emitter<LocaleState> emit,
  ) async {
    const yo = Locale('yo');
    try {
      if (state.locale != yo) {
        AppStorage.saveLocale('yo');
        emit(const _Locale(locale: yo));
      }
    } catch (e) {
      emit(const _Locale(locale: yo));
    }
  }
}
