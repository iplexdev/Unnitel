import 'package:flutter/material.dart';
import 'package:unniTel/src/Components/DrawerWidget/drawerScreen.dart';
import 'package:unniTel/src/Components/homeScreen.dart';
import 'package:unniTel/src/Components/shadowScreen.dart';
class MainScreen extends StatelessWidget {
  final res;
   const MainScreen({this.res});
  @override
  Widget build(BuildContext context) {
    print('accoutFor_mainScreen $res');
    return Scaffold(
      body: Stack(
        children: [
         DrawerScreen(accountData: res),
         ShadowScreen(), 
         HomeScreen(actualData: res)
        ],
      ),
    );
  }
}