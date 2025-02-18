part of 'internet_cubit.dart';

@freezed
class InternetState with _$InternetState {
  const factory InternetState.connecting() = _Connecting;
  const factory InternetState.connected({
    required ConnectionType connectionType,
  }) = _Connected;
  const factory InternetState.disconnected() = _Disconnected;
}
