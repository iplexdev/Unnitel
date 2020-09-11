import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unniTel/src/Components/Auth/login.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:unniTel/src/Components/mainScreen.dart';
// void main() => runApp(MyApp());
 Future<void> main() async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterStatusbarcolor.setStatusBarColor(Colors.lime[600]);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      runApp(
        
        MaterialApp(
          title: 'Unnitel',
          debugShowCheckedModeBanner: false,
          home: token == null ? LoginScreen() : MainScreen()
        )
        );
    }