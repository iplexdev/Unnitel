import 'package:flutter/material.dart';
import 'package:unniTel/src/Components/DrawerWidget/drawerScreen.dart';
import 'package:unniTel/src/Components/homeScreen.dart';
import 'package:unniTel/src/Components/shadowScreen.dart';
class MainScreen extends StatelessWidget {
  final res;
  final charcter;
  final fromPackage;
   const MainScreen({this.res, this.charcter,this.fromPackage});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         DrawerScreen(accountData: res),
         ShadowScreen(), 
         HomeScreen(actualData: res, character: charcter,fromPackage:fromPackage),
        ],
      ),
    );
  }
}