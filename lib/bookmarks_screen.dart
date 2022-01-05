import 'package:flutter/material.dart';
import 'package:responsive_flutter_test/bookmark_widget.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  _BookmarksScreenState createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return BookmarkItem();
              })
      ),
    );
  }
}
