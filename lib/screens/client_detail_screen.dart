import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/client.dart';
import 'package:flutter_application_1/screens/edit_client_screen.dart';

class ClientDetailScreen extends StatelessWidget {
  final Client client;

  const ClientDetailScreen({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${client.firstName} ${client.lastName}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigate to the edit screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditClientScreen(client: client),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(
                client.isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              // Toggle favorite status
              _toggleFavorite(client);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow(
                'Full Name', '${client.firstName} ${client.lastName}'),
            _buildDetailRow('Email', client.email),
            _buildDetailRow('Phone', client.phone),
            _buildDetailRow('City', client.city),
            _buildDetailRow('State', client.state),
            _buildDetailRow('Address', client.address),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.phone),
              label: const Text('Call'),
              onPressed: () {
                _makePhoneCall(client.phone);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _makePhoneCall(String phoneNumber) {
    // Logic to initiate a phone call
  }

  void _toggleFavorite(Client client) {
    // Logic to toggle favorite status
  }
}
