import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:unniTel/src/Components/Auth/PasswordVerification/changePassword.dart';
import 'package:unniTel/src/Components/Auth/login.dart';
import 'package:unniTel/src/Components/Settings/Manage%20Devices/manageDevice.dart';
import 'package:unniTel/src/Components/Settings/Notification/notificationsScreen.dart';
import 'package:unniTel/src/Components/UserProfile/profile.dart';
import 'package:unniTel/src/Components/mainScreen.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isEnable = false;
  // Back arraow widget
  Widget _backArrowWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 0, top: 20, bottom: 10),
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.black,
                  ),
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
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 20, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: Stack(
            children: [
              Column(
                children: [
                  new Divider(
                    color: Hexcolor('#5D6561'),
                  ),
                  Container(
                    height: 500,
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                            leading: Image.asset(
                                'assets/images/notification_icon.png'),
                            title: Text('Notification Settings'),
                            trailing: IconButton(
                                icon: Icon(
                                  Icons.arrow_right_alt_outlined,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NotificationScreen()));
                                })),
                        new Divider(
                          color: Hexcolor('#5D6561'),
                          thickness: 0,
                          indent: 70,
                          height: 0,
                          endIndent: 20,
                        ),
                        ListTile(
                            leading: Image.asset(
                                'assets/images/data_remianing_icon.png'),
                            title: Text('Change password'),
                            trailing: IconButton(
                                icon: Icon(
                                  Icons.arrow_right_alt_outlined,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChangePassword()));
                                })),
                        new Divider(
                          color: Hexcolor('#5D6561'),
                          thickness: 0,
                          indent: 70,
                          endIndent: 20,
                          height: 0,
                        ),
                        ListTile(
                            leading: Image.asset(
                                'assets/images/change_part_icon.png'),
                            title: Text('Change Particulars'),
                            trailing: IconButton(
                                icon: Icon(
                                  Icons.arrow_right_alt_outlined,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Profile()));
                                })),
                        new Divider(
                          color: Hexcolor('#5D6561'),
                          thickness: 0,
                          indent: 70,
                          endIndent: 20,
                          height: 0,
                        ),
                        ListTile(
                            leading: Image.asset('assets/images/help_icon.png'),
                            title: Text('Help'),
                            trailing: IconButton(
                                icon: Icon(
                                  Icons.arrow_right_alt_outlined,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: () {})),
                        new Divider(
                          color: Hexcolor('#5D6561'),
                          thickness: 0,
                          indent: 70,
                          endIndent: 20,
                          height: 0,
                        ),
                        ListTile(
                            leading:
                                Image.asset('assets/images/manage_device.png'),
                            title: Text('Manage Devices'),
                            trailing: IconButton(
                                icon: Icon(
                                  Icons.arrow_right_alt_outlined,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ManageDevices()));
                                })),
                        new Divider(
                          color: Hexcolor('#5D6561'),
                          thickness: 0,
                          indent: 70,
                          endIndent: 20,
                          height: 0,
                        ),
                        ListTile(
                            leading:
                                Image.asset('assets/images/logouts_icon.png'),
                            title: Text('Sign Out'),
                            trailing: IconButton(
                                icon: Icon(
                                  Icons.arrow_right_alt_outlined,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                })),
                        new Divider(
                          color: Hexcolor('#707070'),
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
                                fontSize: 12, color: Hexcolor('#888485'))),
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
