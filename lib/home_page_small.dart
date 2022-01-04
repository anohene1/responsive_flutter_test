import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_flutter_test/calls_screen.dart';
import 'package:responsive_flutter_test/chats_screen.dart';
import 'package:responsive_flutter_test/contacts_screen.dart';

class HomePageSmall extends StatefulWidget {
  const HomePageSmall({Key? key}) : super(key: key);

  @override
  _HomePageSmallState createState() => _HomePageSmallState();
}

class _HomePageSmallState extends State<HomePageSmall> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive App'),
      ),
      drawer: Drawer(
        child: ListView(
          children:[
            ListTile(
              leading: const Icon(CupertinoIcons.alarm),
              title: const Text('Notification'),
              hoverColor: Colors.indigo.withOpacity(0.5),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: const Text('Settings'),
              hoverColor: Colors.indigo.withOpacity(0.5),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.info),
              title: const Text('About'),
              hoverColor: Colors.indigo.withOpacity(0.5),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.conversation_bubble), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone), label: 'Calls'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: 'Contacts'),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          ChatsScreen(),
          CallsScreen(),
          ContactsScreen()
        ],
      ),
    );
  }
}
