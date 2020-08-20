import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isSwitched = false;
  // Back Widget
  Widget _backArrowWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
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
              'Notifications',
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
                    height: 250,
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          leading: Image.asset('assets/images/atrate_icon.png'),
                          title: Text('Email Data usage'),
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
                          title: Text('Data Remaining'),
                          trailing: Switch(
                            value: false,
                            onChanged: (value) {
                              setState(() {
                                // isSwitched = value;
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
                          title: Text('Battery Alarm'),
                          trailing: Switch(
                            value: false,
                            onChanged: (value) {
                              setState(() {
                                // isSwitched = value;
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
