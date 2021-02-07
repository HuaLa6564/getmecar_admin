import 'package:firebase_core/firebase_core.dart';
import 'package:getmecar_admin/map/screens/list.dart';
import 'package:flutter/material.dart';
import 'package:getmecar_admin/map/screens/mapMarker.dart';
import 'package:getmecar_admin/notification/FirebaseMessaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: "Wee"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListMap(),
    );
  }
}
