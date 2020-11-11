import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unniTel/src/Components/Auth/PasswordVerification/changePassword.dart';
import 'package:unniTel/src/Components/Auth/login.dart';
import 'package:unniTel/src/Components/Settings/Manage%20Devices/manageDevice.dart';
import 'package:unniTel/src/Components/Settings/Notification/notificationsScreen.dart';
import 'package:unniTel/src/Components/UserProfile/profile.dart';
import 'package:unniTel/src/Components/mainScreen.dart';

class Settings extends StatefulWidget {
  final actualData;
  const Settings({this.actualData});
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isEnable = false;
  SharedPreferences sharedPreferences;
  // Back arraow widget
  Widget _backArrowWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen(res: widget.actualData,)));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 0, top: 12, bottom: 10,),
                  child:Image(image: AssetImage('assets/images/back-arrow-icon.png'),width: 20, fit: BoxFit.fill,)
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          leading: _backArrowWidget(),
          centerTitle: true,
          title:  Text(
              'Settings',
              style: TextStyle(fontSize: 20,fontFamily: 'CircularStd-Bold', color: Colors.black),
              textAlign: TextAlign.center,
            ),
          
          backgroundColor: Colors.white,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  new Divider(
                    color: HexColor('#5D6561'),
                    height: 0,
                  ),
                  SizedBox(height:10),
                  Container(
                    height: 350,
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NotificationScreen(actualData: widget.actualData))
                                              );
                          },
                            leading: Image.asset(
                                'assets/images/notification_icon.png'),
                            title: Text('Notification Settings',
                             style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              // fontWeight: FontWeight.normal,
                               fontFamily: 'SFUIText-Medium'
                            ),
                            ),
                            trailing: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NotificationScreen(actualData: widget.actualData))
                                              );
                                })),
                        new Divider(
                          color: HexColor('#5D6561'),
                          thickness: 0,
                          indent: 70,
                          height: 0,
                          endIndent: 20,
                        ),
                        ListTile(
                          onTap: () {
                             Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChangePassword(actualData: widget.actualData))
                                              );
                          },
                            leading: Image.asset(
                                'assets/images/data_remianing_icon.png'),
                            title: Text('Change password', style: TextStyle(
                              fontSize: 18,fontFamily: 'SFUIText-Medium',
                              // fontWeight: FontWeight.normal,
                              color: Colors.black
                            ),),
                            trailing: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChangePassword(actualData: widget.actualData))
                                              );
                                })),
                        new Divider(
                          color: HexColor('#5D6561'),
                          thickness: 0,
                          indent: 70,
                          endIndent: 20,
                          height: 0,
                        ),
                        ListTile(
                          onTap: () {
                             Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Profile(accountData: widget.actualData,)));
                          },
                            leading: Image.asset(
                                'assets/images/change_part_icon.png'),
                            title: Text('Change Particulars', style: TextStyle(
                              fontSize: 18,fontFamily: 'SFUIText-Medium',
                              fontWeight: FontWeight.normal,
                              color: Colors.black
                            ),),
                            trailing: IconButton(
                                icon: Icon(
                                   Icons.arrow_forward_rounded,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Profile(accountData: widget.actualData,)));
                                })),
                        new Divider(
                          color: HexColor('#5D6561'),
                          thickness: 0,
                          indent: 70,
                          endIndent: 20,
                          height: 0,
                        ),
                        ListTile(
                            leading: Image.asset('assets/images/help_icon.png'),
                            title: Text('Help', style: TextStyle(
                              fontSize: 18,fontFamily: 'SFUIText-Medium',
                              fontWeight: FontWeight.normal,
                              color: Colors.black
                            ),),
                            trailing: IconButton(
                                icon: Icon(
                                   Icons.arrow_forward_rounded,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: () {})),
                        new Divider(
                          color: HexColor('#5D6561'),
                          thickness: 0,
                          indent: 70,
                          endIndent: 20,
                          height: 0,
                        ),
                        ListTile(
                          onTap: () {
                             Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ManageDevices(accountData: widget.actualData)));
                          },
                            leading:
                                Image.asset('assets/images/manage_device.png'),
                            title: Text('Manage Devices', style: TextStyle(
                              fontSize: 18,fontFamily: 'SFUIText-Medium',
                              fontWeight: FontWeight.normal,
                              color: Colors.black
                            ),),
                            trailing: IconButton(
                                icon: Icon(
                                   Icons.arrow_forward_rounded,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ManageDevices(accountData: widget.actualData)));
                                })),
                        new Divider(
                          color: HexColor('#5D6561'),
                          thickness: 0,
                          indent: 70,
                          endIndent: 20,
                          height: 0,
                        ),
                        ListTile(
                          onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:
                                   (BuildContext context) =>
                                   LoginScreen()), 
                                   (route) => false);
                          },
                            leading:
                                Image.asset('assets/images/logouts_icon.png'),
                            title: Text('Sign Out', style: TextStyle(
                              fontSize: 18,fontFamily: 'SFUIText-Medium',
                              fontWeight: FontWeight.normal,
                              color: Colors.black
                            ),),
                            trailing: IconButton(
                                icon: Icon(
                                   Icons.arrow_forward_rounded,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: () async {
                                  sharedPreferences = await SharedPreferences.getInstance();
                                  sharedPreferences.remove('token');
                                  // ignore: deprecated_member_use
                                  sharedPreferences.commit();
                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginScreen()), (route) => false);
                                })),
                        new Divider(
                          color: HexColor('#707070'),
                          indent: 70,
                          endIndent: 20,
                          height: 0,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Positioned(
                    child: Column(
                      //  crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/images/footer_logo.png',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('App v.3.4.30',
                            style: TextStyle(
                                fontSize: 12, color: HexColor('#888485'))),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
