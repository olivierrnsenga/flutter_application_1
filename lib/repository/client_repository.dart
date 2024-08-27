import 'dart:convert';
import 'package:flutter_application_1/models/client.dart';
import 'package:http/http.dart' as http;

class ClientRepository {
  final String apiUrl =
      'https://localhost:7137/api/Clients?pageNumber=1&pageSize=10';

  Future<List<Client>> fetchClients() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> clientsJson = data['clients'];
      return clientsJson.map((json) => Client.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load clients');
    }
  }

  // Future<Client> addClient(Client client) async {
  //   final response = await http.post(
  //     Uri.parse('https://localhost:7137/api/Clients'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode(client.toJson()),
  //   );
  //   if (response.statusCode == 201) {
  //     return Client.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to add client');
  //   }
  // }
}
