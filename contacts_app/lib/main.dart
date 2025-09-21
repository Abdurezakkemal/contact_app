import 'package:flutter/material.dart';
import 'package:contacts_app/models/contact.dart';
import 'package:contacts_app/add_contact_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final List<Contact> _contacts = [
    Contact(name: 'Abdurezak', phoneNumber: '+251 945911059'),
    Contact(name: 'kemal', phoneNumber: '+251 945911058'),
    Contact(name: 'umer', phoneNumber: '+251 945911057'),
    Contact(name: 'rashed', phoneNumber: '+251 945911056'),
    Contact(name: 'mohamed', phoneNumber: '+251 945911055'),
  ];

  void _removeContact(int index) {
    setState(() {
      _contacts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddContactScreen()));
        },
        tooltip: 'Add Contact',
        child: const Icon(Icons.add),
      ),
      body: _contacts.isEmpty
          ? const Center(child: Text('No items found'))
          : ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                final contact = _contacts[index];
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(contact.name),
                  subtitle: Text(contact.phoneNumber),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeContact(index),
                  ),
                );
              },
            ),
    );
  }
}
