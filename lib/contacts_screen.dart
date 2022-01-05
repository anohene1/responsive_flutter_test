import 'package:flutter/material.dart';
import 'package:responsive_flutter_test/contact_widget.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return ContactItem();
              })
      ),
    );
  }
}
