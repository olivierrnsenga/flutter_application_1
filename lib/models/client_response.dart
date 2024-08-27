import 'package:flutter_application_1/models/client.dart';

class ClientResponse {
  final List<Client> clients;
  final int totalCount;

  ClientResponse({
    required this.clients,
    required this.totalCount,
  });
}
