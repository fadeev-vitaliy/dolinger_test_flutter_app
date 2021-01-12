import 'package:dolinger_test_flutter_app/screens/firstPage/firstPage.dart';
import 'package:dolinger_test_flutter_app/screens/secondPage/secondPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dolinger Test',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => FirstPage(),
        '/second': (BuildContext context) => SecondPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
