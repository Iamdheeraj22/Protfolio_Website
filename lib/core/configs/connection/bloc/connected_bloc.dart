// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'connected_event.dart';

part 'connected_state.dart';

class ConnectedBloc extends Bloc<ConnectedEvent, ConnectedState> {
  StreamSubscription? subscription;

  ConnectedBloc() : super(ConnectedInitialState()) {
    on<ConnectedEvent>((event, emit) => emit(ConnectedSucessState()));
    on<OnNotConnectedEvent>((event, emit) => emit(ConnectedFailureState()));
    on<OnConnectedCheckEvent>(_onConnectedCheckEvent);
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }

  FutureOr<void> _onConnectedCheckEvent(
      OnConnectedCheckEvent event, Emitter<ConnectedState> emit) async {
    if (subscription != null) {
      subscription = Connectivity()
          .onConnectivityChanged
          .listen((List<ConnectivityResult> result) {
        if (result.contains(ConnectivityResult.mobile) ||
            result.contains(ConnectivityResult.wifi)) {
          add(OnConnectedEvent());
        } else {
          add(OnNotConnectedEvent());
        }
      });
    }
  }
}
