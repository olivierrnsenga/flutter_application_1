class Client {
  final int clientID;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String phone;
  late final String address;
  late final String city;
  late final String state;
  final String zipCode;
  final String dateOfBirth;
  bool isFavorite;

  Client({
    required this.clientID,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.dateOfBirth,
    this.isFavorite = false,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      clientID: json['clientID'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      zipCode: json['zipCode'],
      dateOfBirth: json['dateOfBirth'],
    );
  }
}
