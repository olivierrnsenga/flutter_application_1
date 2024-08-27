import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/client.dart';
import 'package:flutter_application_1/widgets/client_data_source.dart';

class ClientTile extends StatelessWidget {
  final List<Client> clients;

  const ClientTile({super.key, required this.clients});

  @override
  Widget build(BuildContext context) {
    final dataSource = ClientDataSource(clients, context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Adjust padding as needed
        child: SizedBox(
          width: double.infinity, // Expand to fill horizontal space
          child: PaginatedDataTable(
            header: const Text('Clients'),
            columns: const [
              DataColumn(label: Text('Email')),
              DataColumn(label: Text('Phone')),
              DataColumn(label: Text('City')),
              DataColumn(label: Text('State')),
              DataColumn(label: Text('Address')),
              DataColumn(label: Text('Actions')),
            ],
            source: dataSource,
            rowsPerPage: 8,
            showCheckboxColumn: false,
          ),
        ),
      ),
    );
  }
}
