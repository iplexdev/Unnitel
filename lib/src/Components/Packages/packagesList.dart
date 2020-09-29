import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:unniTel/src/Components/mainScreen.dart';
import 'package:unniTel/src/Components/utils/drawerItem.dart';

class PackagesList extends StatefulWidget {
  final accountData;
  const PackagesList({this.accountData});
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
                  MaterialPageRoute(builder: (context) => MainScreen(res: widget.accountData,)));
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
            centerTitle: true,
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
                children: [
                  Stack(
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
                                       widget.accountData['devices'][0]['dataPackages'][0]['goodsName'] 
                                       ,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16.0),
                                    ),
                                    Text(
                                      'Price:',
                                      style: TextStyle(
                                          color: Hexcolor('#9D9D9C'),
                                          fontSize: 12.0),
                                    ),
                                    Text(
                                      'Package Data:',
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
                                    width: 80,
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
                                       widget.accountData['devices'][0]['dataPackages'][0]['status'],
                                        style: TextStyle(
                                            color: Hexcolor('#C2D21D'),
                                            fontSize: 8.0),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                          ),
                          
                        ],
                      ),
                       Stack(
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
                                       widget.accountData['devices'][0]['dataPackages'][1]['goodsName'] 
                                       ,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16.0),
                                    ),
                                    Text(
                                      'Price:',
                                      style: TextStyle(
                                          color: Hexcolor('#9D9D9C'),
                                          fontSize: 12.0),
                                    ),
                                    Text(
                                      'Package Data:',
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
                                    width: 80,
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
                                       widget.accountData['devices'][0]['dataPackages'][1]['status'],
                                        style: TextStyle(
                                            color: Hexcolor('#C2D21D'),
                                            fontSize: 8.0),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                          ),
                          
                        ],
                      ),
                       Stack(
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
                                       widget.accountData['devices'][1]['dataPackages'][0]['goodsName'] 
                                       ,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16.0),
                                    ),
                                    Text(
                                      'Price:',
                                      style: TextStyle(
                                          color: Hexcolor('#9D9D9C'),
                                          fontSize: 12.0),
                                    ),
                                    Text(
                                      'Package Data:',
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
                                    width: 80,
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
                                       widget.accountData['devices'][1]['dataPackages'][0]['status'],
                                        style: TextStyle(
                                            color: Hexcolor('#C2D21D'),
                                            fontSize: 8.0),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                          ),
                          
                        ],
                      ),
                       Stack(
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
                                       widget.accountData['devices'][1]['dataPackages'][1]['goodsName'] 
                                       ,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16.0),
                                    ),
                                    Text(
                                      'Price:',
                                      style: TextStyle(
                                          color: Hexcolor('#9D9D9C'),
                                          fontSize: 12.0),
                                    ),
                                    Text(
                                      'Package Data:',
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
                                    width: 80,
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
                                       widget.accountData['devices'][1]['dataPackages'][1]['status'],
                                        style: TextStyle(
                                            color: Hexcolor('#C2D21D'),
                                            fontSize: 8.0),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                          ),
                          
                        ],
                      )
                ]
                ))),
    );
  }
}
