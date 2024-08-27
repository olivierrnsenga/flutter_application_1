import 'package:flutter_application_1/models/client.dart';

abstract class ClientState {}

class ClientInitial extends ClientState {}

class ClientLoading extends ClientState {}

class ClientLoaded extends ClientState {
  final List<Client> clients;

  ClientLoaded(this.clients);
}

class ClientError extends ClientState {
  final String message;

  ClientError(this.message);
}
