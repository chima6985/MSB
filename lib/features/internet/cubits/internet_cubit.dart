import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

part 'internet_cubit.freezed.dart';
part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  InternetCubit({
    required Connectivity connectivity,
  })  : _connectivity = connectivity,
        super(const InternetState.connecting()) {
    monitorInternetConnection();
  }

  /// Connectivity
  final Connectivity _connectivity;

  /// Connectiviy stream subscription
  StreamSubscription? _connectivityStreamSubscription;

  @override
  Future<void> close() {
    _connectivityStreamSubscription?.cancel();
    return super.close();
  }

  /// Monitor internet connection
  StreamSubscription<List<ConnectivityResult>> monitorInternetConnection() {
    return _connectivityStreamSubscription =
        _connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult.contains(ConnectivityResult.mobile)) {
        emit(const _Connected(connectionType: ConnectionType.mobile));
      } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
        emit(const _Connected(connectionType: ConnectionType.wifi));
      } else if (connectivityResult.contains(ConnectivityResult.none)) {
        emit(const _Disconnected());
      }
    });
  }
}
