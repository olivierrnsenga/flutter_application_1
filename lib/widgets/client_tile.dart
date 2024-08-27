import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/blocs/client/client_bloc.dart';
import 'package:flutter_application_1/blocs/client/client_event.dart';
import 'package:flutter_application_1/blocs/client/client_state.dart';
import 'package:flutter_application_1/models/client.dart';
import 'package:flutter_application_1/widgets/client_data_source.dart';

class ClientTile extends StatelessWidget {
  final ClientState state;

  const ClientTile({super.key, required this.state});

  void _handlePageChange(BuildContext context, int page) {
    final clientBloc = BlocProvider.of<ClientBloc>(context);
    clientBloc
        .add(FetchClients(page: page + 1, pageSize: 8)); // Request next page
  }

  @override
  Widget build(BuildContext context) {
    List<Client> clients;
    int totalCount;

    if (state is ClientLoaded) {
      clients = (state as ClientLoaded).clients;
      totalCount = (state as ClientLoaded).totalCount;
    } else {
      clients = [];
      totalCount = 0;
    }

    final dataSource = ClientDataSource(clients, context, totalCount);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
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
            onPageChanged: (page) => _handlePageChange(context, page),
          ),
        ),
      ),
    );
  }
}
