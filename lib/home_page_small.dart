import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_flutter_test/bookmarks_screen.dart';
import 'package:responsive_flutter_test/chats_screen.dart';
import 'package:responsive_flutter_test/contacts_screen.dart';
import 'package:responsive_flutter_test/menu_widget.dart';

class HomePageSmall extends StatefulWidget {
  const HomePageSmall({Key? key, required this.currentIndex, required this.onTapped}) : super(key: key);
  final int currentIndex;
  final Function(int selectedIndex) onTapped;


  @override
  _HomePageSmallState createState() => _HomePageSmallState();
}

class _HomePageSmallState extends State<HomePageSmall> {


  int _currentIndex = 0;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive App'),
      ),
      drawer: Drawer(
        child: MenuWidget(
          selectedItem: _currentIndex,
          onTapped: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
            widget.onTapped(index);
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.conversation_bubble), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.bookmark_solid), label: 'Bookmarks'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: 'Contacts'),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          ChatsScreen(profileIconColor: Colors.black,),
          BookmarksScreen(),
          ContactsScreen()
        ],
      ),
    );
  }
}
