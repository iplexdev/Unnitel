import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:unniTel/src/Components/mainScreen.dart';

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
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen(res: widget.accountData,)));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 0, top: 8, bottom: 10),
                  // child: Icon(
                  //   Icons.keyboard_arrow_left,
                  //   color: Colors.black,
                  // ),
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
    
    final index0 =widget.accountData['devices'][0]['dataPackages'][0]['goodsName'];
    final index1 = widget.accountData['devices'][1]['dataPackages'][0]['goodsName'];
    final  _selectedGBAtIndex0= index0.split(' ');
    final  _selectedGBAtIndex1= index1.split(' ');
    final _index2 = widget.accountData['devices'][0]['dataPackages'][1]['goodsName'];
    final _index3 = widget.accountData['devices'][1]['dataPackages'][1]['goodsName'];
    final  _selectedGBAtIndex2= _index2.split(' ');
    final  _selectedGBAtIndex3= _index3.split(' ');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Hexcolor('#FFFFFF'),
          appBar: AppBar(
            elevation: 0.0,
            leading: _backArrowWidget(),
            centerTitle: true,
            title: Text(
              'Packages',
              style: TextStyle(fontSize: 20,
              fontFamily: 'CircularStd-Bold',
              // fontWeight: FontWeight.bold,
               color: Colors.black),
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
                                  color: Colors.grey.withOpacity(0.19),
                                  // spreadRadius: 5,
                                  blurRadius: 8,
                                  // offset: Offset(0, 3), // changes position of shadow
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
                                      //  widget.accountData['devices'][0]['dataPackages'][0]['goodsName'] 
                                      _selectedGBAtIndex0[0]
                                       ,
                                      style: TextStyle(
                                          color: Colors.black,
                                          // fontWeight: FontWeight.normal,
                                          fontFamily: 'CircularStd-Bold',
                                          fontSize: 16.0),
                                    ),
                                    Text(
                                      'Price: US\$25',
                                      style: TextStyle(
                                          color: Hexcolor('#9D9D9C'),
                                          fontFamily: 'CircularStd-Book',
                                          fontSize: 12.0),
                                    ),
                                    Text(
                                      'Package Data: ' +  _selectedGBAtIndex0[1],
                                      style: TextStyle(
                                          color: Hexcolor('#9D9D9C'),
                                          fontFamily: 'CircularStd-Book',
                                          fontSize: 12.0),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 95.0),
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
                                    width: 50,
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
                                       widget.accountData['devices'][0]['dataPackages'][0]['status'] == 'NOT_ACTIVATED' ? "AVAILABLE":"",
                                        style: TextStyle(
                                            color: Hexcolor('#C2D21D'),
                                            fontFamily: 'CircularStd-Book',
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
                                    color: Colors.grey.withOpacity(0.15),
                                    // spreadRadius: 5,
                                    blurRadius: 7,
                                    // offset: Offset(0, 3), // changes position of shadow
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
                                      //  widget.accountData['devices'][0]['dataPackages'][1]['goodsName'] 
                                       _selectedGBAtIndex2[0]
                                       ,
                                      style: TextStyle(
                                          color: Colors.black,
                                          // fontWeight: FontWeight.normal,
                                          fontFamily: 'CircularStd-Bold',
                                          fontSize: 16.0),
                                    ),
                                    Text(
                                      'Price: US\$15',
                                      style: TextStyle(
                                          color: Hexcolor('#9D9D9C'),
                                          fontFamily: 'CircularStd-Book',
                                          fontSize: 12.0),
                                    ),
                                    Text(
                                      'Package Data: ' + _selectedGBAtIndex2[1],
                                      style: TextStyle(
                                          color: Hexcolor('#9D9D9C'),
                                          fontFamily: 'CircularStd-Book',
                                          fontSize: 12.0),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 95.0),
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
                                    width: 50,
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
                                       widget.accountData['devices'][0]['dataPackages'][1]['status'] == 'IN_USING' ? "ACTIVE" :"",
                                        style: TextStyle(
                                            color: Hexcolor('#C2D21D'),
                                            fontFamily: 'CircularStd-Book',
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
                                      color: Colors.grey.withOpacity(0.15),
                                      // spreadRadius: 5,
                                      blurRadius: 7,
                                      // offset: Offset(0, 3), // changes position of shadow
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
                                      //  widget.accountData['devices'][1]['dataPackages'][0]['goodsName'] 
                                      _selectedGBAtIndex1[0]
                                       ,
                                      style: TextStyle(
                                          color: Colors.black,
                                          // fontWeight: FontWeight.normal,
                                          fontFamily: 'CircularStd-Bold',
                                          fontSize: 16.0),
                                    ),
                                    Text(
                                      'Price: US\$80',
                                      style: TextStyle(
                                          color: Hexcolor('#9D9D9C'),
                                          fontFamily: 'CircularStd-Book',
                                          fontSize: 12.0),
                                    ),
                                    Text(
                                      'Package Data: ' + _selectedGBAtIndex1[1],
                                      style: TextStyle(
                                          color: Hexcolor('#9D9D9C'),
                                          fontFamily: 'CircularStd-Book',
                                          fontSize: 12.0),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 95.0),
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
                                    width: 50,
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
                                       widget.accountData['devices'][0]['dataPackages'][0]['status'] == 'NOT_ACTIVATED' ? "AVAILABLE":"",
                                        style: TextStyle(
                                            color: Hexcolor('#C2D21D'),
                                            fontFamily: 'CircularStd-Book',
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
                                      color: Colors.grey.withOpacity(0.15),
                                      // spreadRadius: 5,
                                      blurRadius: 7,
                                      // offset: Offset(0, 3), // changes position of shadow
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
                                      //  widget.accountData['devices'][1]['dataPackages'][1]['goodsName'] 
                                      _selectedGBAtIndex3[0]
                                       ,
                                      style: TextStyle(
                                          color: Colors.black,
                                          // fontWeight: FontWeight.normal,
                                          fontFamily: 'CircularStd-Bold',
                                          fontSize: 16.0),
                                    ),
                                    Text(
                                      'Price: US\$24',
                                      style: TextStyle(
                                          color: Hexcolor('#9D9D9C'),
                                          fontFamily: 'CircularStd-Book',
                                          fontSize: 12.0),
                                    ),
                                    Text(
                                      'Package Data: ' + _selectedGBAtIndex3[1],
                                      style: TextStyle(
                                          color: Hexcolor('#9D9D9C'),
                                          fontFamily: 'CircularStd-Book',
                                          fontSize: 12.0),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 95.0),
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
                                    width: 50,
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
                                       widget.accountData['devices'][0]['dataPackages'][1]['status'] == 'IN_USING' ? "ACTIVE" :"",
                                        style: TextStyle(
                                            color: Hexcolor('#C2D21D'),
                                            fontFamily: 'CircularStd-Book',
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
