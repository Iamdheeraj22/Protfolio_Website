part of 'connected_bloc.dart';

@immutable
abstract class ConnectedEvent {}

class OnConnectedEvent extends ConnectedEvent {}

class OnNotConnectedEvent extends ConnectedEvent {}

class OnConnectedCheckEvent extends ConnectedEvent {}
