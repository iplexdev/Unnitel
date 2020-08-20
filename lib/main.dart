import 'package:flutter/material.dart';
import 'package:unniTel/src/Components/Auth/login.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)  {
    FlutterStatusbarcolor.setStatusBarColor(Colors.lime[600]);
    return MaterialApp(
      title: 'Unnitel',
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}