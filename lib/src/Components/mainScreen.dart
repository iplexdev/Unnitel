import 'package:flutter/material.dart';
import 'package:unniTel/src/Components/DrawerWidget/drawerScreen.dart';
import 'package:unniTel/src/Components/homeScreen.dart';
import 'package:unniTel/src/Components/shadowScreen.dart';
class MainScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         DrawerScreen(),
         ShadowScreen(), 
        HomeScreen()
        ],
      ),
    );
  }
}