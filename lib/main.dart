import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unniTel/src/Components/Auth/login.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter/services.dart';
// void main() => runApp(MyApp());
 Future<void> main() async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterStatusbarcolor.setStatusBarColor(Hexcolor('#6E0F24'));
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      runApp(
        
        MaterialApp(
          title: 'Unnitel',
          debugShowCheckedModeBanner: false,
          // home: token == null ? LoginScreen() : LoginScreen()
          home:LoginScreen()
        )
        );
    }