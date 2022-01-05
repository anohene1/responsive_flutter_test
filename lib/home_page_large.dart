import 'package:flutter/material.dart';
import 'package:responsive_flutter_test/menu_widget.dart';

import 'bookmarks_screen.dart';
import 'chats_screen.dart';
import 'contacts_screen.dart';

class HomePageLarge extends StatefulWidget {
  HomePageLarge({Key? key, required this.currentIndex, required this.onTapped}) : super(key: key);

  final int currentIndex;
  final Function(int selectedIndex) onTapped;

  @override
  _HomePageLargeState createState() => _HomePageLargeState();
}

class _HomePageLargeState extends State<HomePageLarge> {

int selectedIndex = 0;


@override
void initState() {
  // TODO: implement initState
  super.initState();
  selectedIndex = widget.currentIndex;
}

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: MenuWidget(
                selectedItem: selectedIndex,
                onTapped: (index) {
                  setState(() {
                    selectedIndex = index;
                    widget.onTapped(index);
                  });
                },
              )),
          Expanded(
            flex: 3,
            child: IndexedStack(
            index: selectedIndex,
            children: [
              ChatsScreen(profileIconColor: Colors.black,),
              BookmarksScreen(),
              ContactsScreen()
            ],
          ),)

        ],
      )
    );
  }
}
