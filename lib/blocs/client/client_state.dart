import 'package:flutter_application_1/models/client.dart';

abstract class ClientState {}

class ClientInitial extends ClientState {}

class ClientLoading extends ClientState {}

class ClientLoaded extends ClientState {
  final List<Client> clients;
  final int totalCount;

  ClientLoaded({
    required this.clients,
    required this.totalCount,
  });
}

class ClientError extends ClientState {
  final String message;

  ClientError(this.message);
}
