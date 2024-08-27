import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/client.dart';
import 'package:flutter_application_1/widgets/client_data_source.dart';
import 'package:flutter_application_1/blocs/client/client_state.dart';

class ClientTile extends StatelessWidget {
  final ClientState state;

  const ClientTile({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    List<Client> clients;
    int totalCount;

    if (state is ClientLoaded) {
      clients = (state as ClientLoaded).clients;
      totalCount = (state as ClientLoaded).totalCount; // Get totalCount
    } else {
      clients = [];
      totalCount = 0;
    }

    final dataSource = ClientDataSource(clients, context, totalCount);

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
            onPageChanged: (pageIndex) {
              // Optionally handle page changes if needed
            },
          ),
        ),
      ),
    );
  }
}
