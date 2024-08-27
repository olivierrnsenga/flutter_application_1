abstract class ClientEvent {}

class FetchClients extends ClientEvent {
  final int page;
  final int pageSize;

  FetchClients({required this.page, required this.pageSize});
}
