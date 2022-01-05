import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  MenuWidget({Key? key, required this.onTapped, required this.selectedItem}) : super(key: key);
  final Function(int selectedIndex) onTapped;
  final int selectedItem;



  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {

  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:[
        LayoutBuilder(builder: (context, constraints) {
          if (MediaQuery.of(context).size.width > 600) {
            return Column(
              children: [
                ListTile(
                  tileColor: selectedIndex == 0 ? Colors.deepPurple : Colors.transparent,
                  leading: const Icon(CupertinoIcons.conversation_bubble),
                  title: const Text('Chats'),
                  hoverColor: Colors.indigo.withOpacity(0.5),
                  onTap: (){
                    setState(() {
                      selectedIndex = 0;
                      widget.onTapped(selectedIndex);
                    });
                  },
                ),
                ListTile(
                  tileColor: selectedIndex == 1 ? Colors.deepPurple : Colors.transparent,

                  leading: const Icon(CupertinoIcons.bookmark_solid),
                  title: const Text('Bookmarks'),
                  hoverColor: Colors.indigo.withOpacity(0.5),
                  onTap: (){
                    setState(() {
                      selectedIndex = 1;
                      widget.onTapped(selectedIndex);
                    });
                  },
                ),
                ListTile(
                  tileColor: selectedIndex == 2 ? Colors.deepPurple : Colors.transparent,

                  leading: const Icon(CupertinoIcons.person),
                  title: const Text('People'),
                  hoverColor: Colors.indigo.withOpacity(0.5),
                  onTap: (){
                    setState(() {
                      selectedIndex = 2;
                      widget.onTapped(selectedIndex);
                    });
                  },
                ),
              ],
            );
          }
          return Container();
        }),
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
    );
  }
}
