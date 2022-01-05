import 'package:flutter/material.dart';
import 'package:responsive_flutter_test/conversation_widget.dart';

class ChatsScreen extends StatefulWidget {
  ChatsScreen({Key? key, required this.profileIconColor}) : super(key: key);
  final Color profileIconColor;

  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        child: ListView.builder(
          itemCount: 15,
            itemBuilder: (context, index) {
          return PeopleItem();
        })
      ),
    );
  }
}
