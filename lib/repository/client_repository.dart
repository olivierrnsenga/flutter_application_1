import 'dart:convert';
import 'package:flutter_application_1/models/client.dart';
import 'package:flutter_application_1/models/client_response.dart';
import 'package:http/http.dart' as http;

class ClientRepository {
  final String baseUrl = 'https://localhost:7137/api';

  Future<ClientResponse> getClients(int page, int pageSize) async {
    final response = await http
        .get(Uri.parse('$baseUrl/clients?pageNumber=$page&pageSize=$pageSize'));

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);

      Iterable jsonResponse = responseBody['clients'];
      final List<Client> clients =
          jsonResponse.map((client) => Client.fromJson(client)).toList();

      // Extract total count from the headers
      final xPagination = response.headers['x-pagination'];
      int totalCount = 0;
      if (xPagination != null) {
        final paginationData = json.decode(xPagination);
        totalCount = paginationData['TotalCount'] ??
            0; // Default to 0 if TotalCount is not present
      }

      return ClientResponse(
        clients: clients,
        totalCount: totalCount,
      );
    } else {
      // You might want to provide more details in the exception or handle different status codes
      throw Exception(
          'Failed to load clients. Status code: ${response.statusCode}');
    }
  }
}
