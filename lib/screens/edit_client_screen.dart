import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/client.dart';

class EditClientScreen extends StatefulWidget {
  final Client client;

  const EditClientScreen({super.key, required this.client});

  @override
  // ignore: library_private_types_in_public_api
  _EditClientScreenState createState() => _EditClientScreenState();
}

class _EditClientScreenState extends State<EditClientScreen> {
  final _formKey = GlobalKey<FormState>();

  late String _firstName;
  late String _lastName;
  late String _email;
  late String _phone;
  late String _city;
  late String _state;
  late String _address;

  @override
  void initState() {
    super.initState();

    // Initialize form fields with current client data
    _firstName = widget.client.firstName;
    _lastName = widget.client.lastName;
    _email = widget.client.email;
    _phone = widget.client.phone;
    _city = widget.client.city;
    _state = widget.client.state;
    _address = widget.client.address;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Client'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveClient,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(
                  'First Name', _firstName, (value) => _firstName = value!),
              _buildTextField(
                  'Last Name', _lastName, (value) => _lastName = value!),
              _buildTextField('Email', _email, (value) => _email = value!,
                  keyboardType: TextInputType.emailAddress),
              _buildTextField('Phone', _phone, (value) => _phone = value!,
                  keyboardType: TextInputType.phone),
              _buildTextField('City', _city, (value) => _city = value!),
              _buildTextField('State', _state, (value) => _state = value!),
              _buildTextField(
                  'Address', _address, (value) => _address = value!),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, String initialValue, FormFieldSetter<String> onSaved,
      {TextInputType keyboardType = TextInputType.text, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        initialValue: initialValue,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        keyboardType: keyboardType,
        maxLines: maxLines,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
        onSaved: onSaved,
      ),
    );
  }

  void _saveClient() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Update the client object
      setState(() {
        widget.client.firstName = _firstName;
        widget.client.lastName = _lastName;
        widget.client.email = _email;
        widget.client.phone = _phone;
        widget.client.city = _city;
        widget.client.state = _state;
        widget.client.address = _address;
      });

      // Perform any additional save operations (e.g., update the database)

      Navigator.pop(context,
          widget.client); // Return to the previous screen with updated client
    }
  }
}
