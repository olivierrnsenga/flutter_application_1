import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/blocs/client/client_bloc.dart';
import 'package:flutter_application_1/blocs/client/client_event.dart';
import 'package:flutter_application_1/blocs/client/client_state.dart';
import 'package:flutter_application_1/repository/client_repository.dart';
import 'package:flutter_application_1/widgets/client_tile.dart';

class ClientListScreen extends StatelessWidget {
  const ClientListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clients'),
      ),
      body: BlocProvider(
        create: (context) =>
            ClientBloc(RepositoryProvider.of<ClientRepository>(context))
              ..add(FetchClients()),
        child: BlocBuilder<ClientBloc, ClientState>(
          builder: (context, state) {
            if (state is ClientLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ClientLoaded) {
              return ClientTile(clients: state.clients);
            } else if (state is ClientError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('No data'));
            }
          },
        ),
      ),
    );
  }
}
