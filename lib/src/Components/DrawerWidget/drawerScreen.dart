
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
  Color color = Colors.white;
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
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Profile(data: 'home', accountData: widget.accountData,)));
                },
                child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Container(
                    decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
                  child:CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/user-profile-icon.png'),
                  ),
                  ),
                  SizedBox(
                      height: 10,
                  ),
                  Text(widget.accountData['accountData']['name']
                    , style:TextStyle(fontSize:22,color:Colors.white,fontFamily: 'CircularStd-Medium')),
                  SizedBox(
                height: 10,
              ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Profile(data: 'home', accountData: widget.accountData,)));
              //   },
              // )
                Text('View Profile',style: TextStyle(fontSize: 14,fontFamily: 'CircularStd-Book', color: HexColor("#888485")),),
                ],
              ),
              )
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
                         Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(res: widget.accountData,)));
                       }
                       break;
                       case 'Sign Out': {
                         bool color = true;
                         sharedPreferences = await SharedPreferences.getInstance();
                         sharedPreferences.remove('token');
                         // ignore: deprecated_member_use
                         sharedPreferences.commit();
                         Navigator.of(context).pushAndRemoveUntil(
                           MaterialPageRoute(builder: (BuildContext context) => LoginScreen()), (Route<dynamic> route) => false);
                       }
                       break;
                       case 'My Account': {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(data:'myAccount', accountData: widget.accountData,)));
                       }
                       break;
                       case 'Packages' :{
                        //  Navigator.push(context, MaterialPageRoute(builder: (context) => PackagesList( accountData: widget.accountData)));
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(res: widget.accountData,fromPackage:'package')));
                       }
                       break;
                       case 'Settings' : {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => Settings(actualData: widget.accountData)));
                       }
                       break;
                       case 'Devices': {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ManageDevices(data:'manage', accountData: widget.accountData,)));
                       }
                       break;
                     }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Image.asset(e['icon'], color: e['title'] == 'Home' ? Colors.white : Colors.grey,width: 22,), 
                  SizedBox(
                    width: 18,
                  ),
                  Container(
                    transform: Matrix4.translationValues(0.0, 3.0, 0.0),
                    child: Text(e['title'],style: TextStyle(color: e['title'] == 'Home' ? Colors.white : Colors.grey,fontFamily: 'CircularStd-Book', fontSize: 18))),
                ],
              ),
              )
             
            )
            ).toList(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text('App v.3.4.30',style:TextStyle(fontSize:12,color:HexColor('#888485'))),
              Image.asset('assets/images/footer_logo.png',)
            ]
          )
        ],
      ),
    );
  }
}