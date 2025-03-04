part of 'locale_bloc.dart';

@freezed
class LocaleEvent with _$LocaleEvent {
  const factory LocaleEvent.initialLocale() = _InitialLocale;
  const factory LocaleEvent.enLocale() = _EnLocale;
  const factory LocaleEvent.yoLocale() = _YoLocale;
}
