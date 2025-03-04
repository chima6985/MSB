part of 'locale_bloc.dart';

@freezed
class LocaleState with _$LocaleState {
  const factory LocaleState.locale({
    required Locale locale,
  }) = _Locale;
}
