import 'package:flutter/material.dart';
import 'package:responsive_flutter_test/home_page_large.dart';
import 'package:responsive_flutter_test/home_page_small.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return HomePageSmall(onTapped: (int selectedIndex) { setState(() {
              currentIndex = selectedIndex;
            }); }, currentIndex: currentIndex,);
          } else {
            return HomePageLarge(onTapped: (int selectedIndex) { setState(() {
              currentIndex = selectedIndex;
            }); }, currentIndex: currentIndex,);
          }
        },
      ),
    );
  }
}
