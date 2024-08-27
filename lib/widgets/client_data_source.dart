import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/client.dart';
import 'package:flutter_application_1/screens/client_detail_screen.dart';
import 'package:flutter_application_1/screens/edit_client_screen.dart';

class ClientDataSource extends DataTableSource {
  final List<Client> clients;
  final BuildContext context;
  final int totalCount; // Add totalCount

  ClientDataSource(this.clients, this.context, this.totalCount);

  @override
  DataRow getRow(int index) {
    if (index >= clients.length) {
      // If the index is out of bounds, return an empty row or handle appropriately
      return DataRow(cells: List.generate(6, (_) => const DataCell(Text(''))));
    }
    final Client client = clients[index];
    return DataRow(
      cells: [
        DataCell(Text(client.email)),
        DataCell(Text(client.phone)),
        DataCell(Text(client.city)),
        DataCell(Text(client.state)),
        DataCell(Text(client.address)),
        DataCell(
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'view':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ClientDetailScreen(client: client),
                    ),
                  );
                  break;
                case 'edit':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditClientScreen(client: client),
                    ),
                  );
                  break;
                case 'delete':
                  _confirmDelete(context, client);
                  break;
                case 'call':
                  _makePhoneCall(client.phone);
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'view',
                  child: Row(
                    children: [
                      Icon(Icons.arrow_forward_ios, color: Colors.black54),
                      SizedBox(width: 8),
                      Text('View Details'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'edit',
                  child: Row(
                    children: [
                      Icon(Icons.edit, color: Colors.black54),
                      SizedBox(width: 8),
                      Text('Edit'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: Colors.black54),
                      SizedBox(width: 8),
                      Text('Delete'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'call',
                  child: Row(
                    children: [
                      Icon(Icons.phone, color: Colors.black54),
                      SizedBox(width: 8),
                      Text('Call'),
                    ],
                  ),
                ),
              ];
            },
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => totalCount; // Use totalCount for rowCount

  @override
  int get selectedRowCount => 0;

  void setSelectedRowCount(int count) {}

  void _confirmDelete(BuildContext context, Client client) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this client?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                // Perform delete action here
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _makePhoneCall(String phoneNumber) {
    // Logic to initiate a phone call
  }
}
