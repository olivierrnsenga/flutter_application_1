import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/client_repository.dart';
import 'package:flutter_application_1/screens/client_list_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => ClientRepository()),
      ],
      child: MaterialApp(
        title: 'Client Apps',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ClientListScreen(),
      ),
    );
  }
}
