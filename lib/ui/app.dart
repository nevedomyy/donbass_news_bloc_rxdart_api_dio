import 'package:flutter/material.dart';
import 'intro.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.black,
        textTheme: TextTheme(
          title: TextStyle(color: Colors.white, fontSize: 45.0, fontFamily: 'PlayfairDisplay-Regular'),
          subtitle: TextStyle(color: Colors.white, fontSize: 50.0, fontFamily: 'PlayfairDisplay-Regular'),
          button: TextStyle(color: Colors.white, fontSize: 22.0, fontFamily: 'Literata-Regular'),
          display1: TextStyle(color: Colors.black, fontSize: 22.0, fontFamily: 'OldStandardTT-Regular'),
          headline: TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold, fontFamily: 'OldStandardTT-Regular'),
          body1: TextStyle(color: Colors.black, fontSize: 16.0, fontFamily: 'Literata-Regular'),
          body2: TextStyle(color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.bold ,fontFamily: 'Literata-Regular'),
          overline: TextStyle(color: Colors.black, fontSize: 12.0, fontFamily: 'Literata-Regular'),
          subhead: TextStyle(color: Colors.black, fontSize: 30.0, fontFamily: 'PlayfairDisplay-Regular'),
        )
      ),
      home: IntroPage(),
    );
  }
}