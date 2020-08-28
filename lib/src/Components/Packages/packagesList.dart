import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:unniTel/src/Components/mainScreen.dart';
import 'package:unniTel/src/Components/utils/drawerItem.dart';

class PackagesList extends StatefulWidget {
  @override
  _PackagesListState createState() => _PackagesListState();
}

class _PackagesListState extends State<PackagesList> {
// Back arraow widget
  Widget _backArrowWidget() {
    return Container(
      child: Row(
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
                  padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
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
          appBar: AppBar(
            elevation: 0.0,
            leading: _backArrowWidget(),
            title: Text(
              'Packages',
              style: TextStyle(fontSize: 20, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.white,
          ),
          body: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: packagesList
                    .map(
                      (e) => Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 0,
                                  blurRadius: 10,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Image.asset(
                              'assets/images/mask_icon.png',
                              height: 100,
                            ),
                          ),
                          Container(
                              child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 20,right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e['title'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16.0),
                                    ),
                                    Text(
                                      'Price:${e['price']}',
                                      style: TextStyle(
                                          color: Hexcolor('#9D9D9C'),
                                          fontSize: 12.0),
                                    ),
                                    Text(
                                      'Package Data:${e['packageData']}',
                                      style: TextStyle(
                                          color: Hexcolor('#9D9D9C'),
                                          fontSize: 12.0),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 100.0),
                                  child: FDottedLine(
                                    color: Hexcolor("#F0F1F6"),
                                    height: 60.0,
                                    dottedLength: 4,
                                    space: 2,
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 25,
                                    width: 57,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        color: Hexcolor('#F9FBE8')),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        e['action'],
                                        style: TextStyle(
                                            color: Hexcolor('#C2D21D'),
                                            fontSize: 12.0),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                        ],
                      ),
                    )
                    .toList(),
              ))),
    );
  }
}
