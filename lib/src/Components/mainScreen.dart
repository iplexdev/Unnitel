import 'package:flutter/material.dart';
import 'package:unniTel/src/Components/DrawerWidget/drawerScreen.dart';
import 'package:unniTel/src/Components/homeScreen.dart';
import 'package:unniTel/src/Components/shadowScreen.dart';
class MainScreen extends StatelessWidget {
  final res;
  final charcter;
   const MainScreen({this.res, this.charcter});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         DrawerScreen(accountData: res),
         ShadowScreen(), 
         HomeScreen(actualData: res, character: charcter),
        ],
      ),
    );
  }
}