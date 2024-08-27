import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/blocs/client/client_event.dart';
import 'package:flutter_application_1/blocs/client/client_state.dart';
import 'package:flutter_application_1/repository/client_repository.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  final ClientRepository clientRepository;

  ClientBloc(this.clientRepository) : super(ClientInitial()) {
    on<FetchClients>(_onFetchClients);
  }

  Future<void> _onFetchClients(
      FetchClients event, Emitter<ClientState> emit) async {
    emit(ClientLoading());
    try {
      final clients = await clientRepository.fetchClients();
      emit(ClientLoaded(clients));
    } catch (e) {
      emit(ClientError(e.toString()));
    }
  }
}
