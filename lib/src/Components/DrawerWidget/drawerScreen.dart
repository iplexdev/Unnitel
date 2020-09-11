
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unniTel/src/Components/Auth/login.dart';
import 'package:unniTel/src/Components/Packages/packagesList.dart';
import 'package:unniTel/src/Components/Settings/Manage%20Devices/manageDevice.dart';
import 'package:unniTel/src/Components/Settings/setting.dart';
import 'package:unniTel/src/Components/UserProfile/profile.dart';
import 'package:unniTel/src/Components/mainScreen.dart';
import 'package:unniTel/src/Components/utils/drawerItem.dart';
class DrawerScreen extends StatefulWidget {
  final accountData;
  const DrawerScreen({this.accountData});
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  SharedPreferences sharedPreferences;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:10,left: 20),
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  CircleAvatar(),
                  SizedBox(
                      height: 10,
                  ),
                  Text('userName', style:TextStyle(fontSize:22,color:Colors.white,fontWeight: FontWeight.bold)),
                  SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Profile(data: 'home', accountData: widget.accountData['accountData'],)));
                },
                child: Text('View Profile',style: TextStyle(fontSize: 14, color: Colors.white),),
              )
                ],
              ),
            ],
          ),
          Column(
            children: drawerItems.map((e) => 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                     switch(e['title']) {
                       case 'Home': {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
                       }
                       break;
                       case 'Sign Out': {
                         sharedPreferences = await SharedPreferences.getInstance();
                         sharedPreferences.remove('token');
                         // ignore: deprecated_member_use
                         sharedPreferences.commit();
                         Navigator.of(context).pushAndRemoveUntil(
                           MaterialPageRoute(builder: (BuildContext context) => LoginScreen()), (Route<dynamic> route) => false);
                       }
                       break;
                       case 'My Account': {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(data:'myAccount')));
                       }
                       break;
                       case 'Packages' :{
                         Navigator.push(context, MaterialPageRoute(builder: (context) => PackagesList()));
                       }
                       break;
                       case 'Settings' : {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
                       }
                       break;
                       case 'Devices': {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ManageDevices()));
                       }
                       break;
                     }
                },
                child: Row(
                children: [
                   Icon(e['icon'], color: Colors.white,), 
                  SizedBox(
                    width: 15,
                  ),
                  Text(e['title'],style: TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
              )
             
            )
            ).toList(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text('App v.3.4.30',style:TextStyle(fontSize:12,color:Hexcolor('#888485'))),
              Image.asset('assets/images/footer_logo.png',)
            ]
          )
        ],
      ),
    );
  }
}