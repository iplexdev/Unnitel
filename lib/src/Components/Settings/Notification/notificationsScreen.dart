import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class NotificationScreen extends StatefulWidget {
  final actualData;
  const NotificationScreen({this.actualData});
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isSwitched = true;
  bool isSwitch = true;
  bool isEnable = true;
  // Back Widget
  Widget _backArrowWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 0, top: 12, bottom: 10),
                  // child: Icon(
                  //   Icons.keyboard_arrow_left,
                  //   color: Colors.black,
                  // ),
                  child:Image(image: AssetImage('assets/images/back-arrow-icon.png'),width: 20, fit: BoxFit.fill,),
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
          title:Text(
              'Notifications',
              style: TextStyle(fontSize: 20,fontFamily: 'CircularStd-Bold', color: Colors.black),
              textAlign: TextAlign.center,
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
                    height: 0,
                  ),
                  Container(
                    height: 250,
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          leading: Image.asset('assets/images/atrate_icon.png'),
                          title: Text('Email Data usage', style: TextStyle(
                              fontSize: 18,fontFamily: 'SFUIText-Medium',
                            ),),
                          trailing: Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            },
                            activeTrackColor: Hexcolor('#C2D22B'),
                            activeColor: Colors.white,
                          ),
                        ),
                        new Divider(
                          color: Hexcolor('#5D6561'),
                          thickness: 0,
                          indent: 70,
                          endIndent: 40,
                        ),
                        ListTile(
                          leading: Image.asset(
                              'assets/images/data_remianing_icon.png'),
                          title: Text('Data Remaining', style: TextStyle(
                              fontSize: 18,fontFamily: 'SFUIText-Medium',
                            ),),
                         trailing: Switch(
                            value: isSwitch,
                            onChanged: (value) {
                              setState(() {
                                isSwitch = value;
                              });
                            },
                            activeTrackColor: Hexcolor('#C2D22B'),
                            activeColor: Colors.white,
                          ),
                        ),
                        new Divider(
                          color: Hexcolor('#5D6561'),
                          thickness: 0,
                          indent: 70,
                          endIndent: 40,
                        ),
                        ListTile(
                          leading:
                              Image.asset('assets/images/battery_icon.png'),
                          title: Text('Battery Alarm', style: TextStyle(
                              fontSize: 18,fontFamily: 'SFUIText-Medium',
                            ),),
                          trailing: Switch(
                            value: isEnable,
                            onChanged: (value) {
                              setState(() {
                                isEnable = value;
                              });
                            },
                            activeTrackColor: Hexcolor('#C2D22B'),
                            activeColor: Colors.white,
                          ),
                        ),
                        new Divider(
                          color: Hexcolor('#5D6561'),
                          thickness: 0,
                          indent: 70,
                          endIndent: 40,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
