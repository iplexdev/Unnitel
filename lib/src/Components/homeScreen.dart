import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:unniTel/src/Components/Auth/login.dart';
import 'package:unniTel/src/Components/DataPackages/Top-up-Widget/topUpWidget.dart';
import 'package:unniTel/src/Components/Settings/setting.dart';

class HomeScreen extends StatefulWidget {
  
  final data;
  final actualData;
  const HomeScreen({this.data, this.actualData});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
bool isEnable = false;
int _character = 0;
class _HomeScreenState extends State<HomeScreen>

    with SingleTickerProviderStateMixin {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawrEnable = false;
  TabController _tabController;
  SharedPreferences sharedPreferences;
  void initState() {
    super.initState();
    checkLoginStatus();
    _tabController = TabController(vsync: this, length: 2);
  }

  int _tabIndex = 0;
  void _toggleTab() {
    _tabIndex = _tabController.index + 1;
    _tabController.animateTo(_tabIndex);
  }
  // Check login status
  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('token') == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginScreen()), (Route<dynamic> route) => false);
    }
  }
  @override
// ********************* DATA PACKAGES WIDGETS ************
  Widget _speedoMeterWidgetDP() {
    return Container(
        color: Hexcolor('#6E0F24'),
        height: 320,
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
              minimum: 0,
              maximum: 100,
              axisLabelStyle: GaugeTextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
              ranges: <GaugeRange>[
                GaugeRange(startValue: 0, endValue:  _character ==0 ? widget.actualData['devices'][0]['connectionStatus']['dataFlowGB'] : 0, color: Colors.green),
                GaugeRange(
                    startValue: 100, endValue: 100, color: Colors.orange),
                GaugeRange(startValue: 100, endValue: 100, color: Colors.red),
              ],
              pointers: <GaugePointer>[
                NeedlePointer(value: _character ==0 ? widget.actualData['devices'][0]['connectionStatus']['dataFlowGB'] : 0)
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Container(
                      child: Column(
                        children: [
                          Text(
                            'Remaining',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                           _character == 0 ?(widget.actualData['devices'][0]['connectionStatus']['dataFlowGB']).toStringAsFixed(3):
                        '0 MB',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Global 5GB',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          SizedBox(
                            height: 150,
                          ),
                          _topUpWidget(),
                        ],
                      ),
                    ),
                    angle: 90,
                    positionFactor: 0.25)
              ])
        ]));
  }

  // TOP UP Widget
  Widget _topUpWidget() {
    return InkWell(
      onTap: () {
        // Navigate to TopUp Widget Screen
        Navigator.push(context, MaterialPageRoute(builder: (context) => TopUpWidget(selectedDevice: _character,actualData : widget.actualData)));
      },
      child: Container(
        width: 100,
        margin: EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: Colors.grey,
            width: 0,
          ),
          color: Colors.white,
        ),
        child: Text(
          "Top-Up",
          style: TextStyle(
            fontSize: 14,
            color: Hexcolor('#6E0F24'),
          ),
        ),
      ),
    );
  }

  // _available Package Widget
  Widget _availablePackageWidget() {
    return Center(
      child: Text(
        'Available Packages',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // Available Package List Widget
  Widget _availablePackageListWidget() {
    return Container(
      child: Column(
        children: [
          // IN USE STACK 1
          Stack(
            children: <Widget>[
              Container(
                child: Image.asset(
                  'assets/images/mask_icon.png',
                  height: 100,
                ),
              ),
              Container(
                
                  child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _character ==0 ? widget.actualData['devices'][0]['dataPackages'][0]['goodsName']:
                            widget.actualData['devices'][1]['dataPackages'][0]['goodsName'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0),
                        ),
                        Text(
                          _character ==0 ? 
                          'Remaining Balance:' + (widget.actualData['devices'][0]['dataPackages'][0]['remainingDataMB']).toString() + 'MB' :
                          'Remaining Balance:' + (widget.actualData['devices'][1]['dataPackages'][0]['remainingDataMB']).toString() + 'MB',
                          style: TextStyle(
                              color: Hexcolor('#9D9D9C'), fontSize: 12.0),
                        ),
                        Text(
                          _character == 0?
                          'Purchase Date:' + (widget.actualData['devices'][0]['dataPackages'][0]['purchaseDate']).toString(): 
                          'Purchase Date:' + (widget.actualData['devices'][1]['dataPackages'][0]['purchaseDate']).toString(),
                          style: TextStyle(
                              color: Hexcolor('#9D9D9C'), fontSize: 12.0),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 65.0),
                      child: FDottedLine(
                        color: Hexcolor("#F0F1F6"),
                        height: 60.0,
                        dottedLength: 4,
                        space: 2,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 25,
                      width: _character == 0 || _character == 1 ? 80 : 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          color: Hexcolor('#E5F7F1')),
                      child: Text(
                       _character == 0 ? widget.actualData['devices'][0]['dataPackages'][0]['status'] 
                       : widget.actualData['devices'][1]['dataPackages'][0]['status'] ,
                        style: TextStyle(
                            color: Hexcolor('#00B074'), fontSize: _character == 0 || _character == 1 ?  8.0 : 12),
                      ),
                    )
                  ],
                ),
              )
              ),
            ],
          ),
          // USE STACK 2
          Stack(
            children: <Widget>[
              Container(
                child: Image.asset(
                  'assets/images/mask_icon.png',
                  height: 100,
                ),
              ),
              Container(
                  child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _character ==0 ? widget.actualData['devices'][0]['dataPackages'][1]['goodsName']:
                          widget.actualData['devices'][1]['dataPackages'][1]['goodsName'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0),
                        ),
                        Text(
                          _character == 0 ?
                          'Remaining Balance:' + (widget.actualData['devices'][0]['dataPackages'][1]['remainingDataMB']).toString() + 'MB' :
                          'Remaining Balance:' + (widget.actualData['devices'][1]['dataPackages'][1]['remainingDataMB']).toString() + 'MB',
                          style: TextStyle(
                              color: Hexcolor('#9D9D9C'), fontSize: 12.0),
                        ),
                        Text(
                          _character == 0?
                          'Purchase Date:' + (widget.actualData['devices'][0]['dataPackages'][1]['purchaseDate']).toString():
                            'Purchase Date:' + (widget.actualData['devices'][1]['dataPackages'][1]['purchaseDate']).toString(),
                          style: TextStyle(
                              color: Hexcolor('#9D9D9C'), fontSize: 12.0),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 65.0),
                      child: FDottedLine(
                        color: Hexcolor("#F0F1F6"),
                        height: 60.0,
                        dottedLength: 4,
                        space: 2,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 25,
                      width: 58,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          color: Hexcolor('#F9FBE8')),
                      child: Text(
                        _character == 0 ? widget.actualData['devices'][0]['dataPackages'][1]['status'] 
                       :widget.actualData['devices'][1]['dataPackages'][1]['status'] ,
                        style: TextStyle(
                            color: Hexcolor('#C2D21D'), fontSize: 12.0),
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
// ********************* END DATA PACKAGES WIDGETS ************

// Drawer widget
  Widget _drawerWidget() {
    return Container(
      child: Builder(
        builder: (BuildContext context) {
          return Container(
            child: isDrawrEnable
                ? IconButton(
                    icon: Image(
                      image: AssetImage('assets/images/menu_icon.png'),
                      height: 100,
                      width: 200,
                    ),
                    onPressed: () {
                      setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        scaleFactor = 1;
                        isDrawrEnable = false;
                      });
                    })
                : IconButton(
                    icon: Image(
                      image: AssetImage('assets/images/menu_icon.png'),
                      height: 100,
                      width: 200,
                    ),
                    onPressed: () {
                      setState(() {
                        xOffset = 320;
                        yOffset = 130;
                        scaleFactor = 0.7;
                        isDrawrEnable = true;
                      });
                    }),
          );
        },
      ),
    );
  }

// Info Data Widget
  Widget _infoDataWidget() {
    print('checkingRadioType==== $_character');
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          Image.asset('assets/images/battery_icon.png'),
          SizedBox(
            width: 5,
          ),
          Text(
            _character == 0 ? widget.actualData['devices'][0]['connectionStatus']['powerLeft'] : '0%',
            style: TextStyle(fontSize: 18, color: Hexcolor("#00B074")),
          ),
        ]),
        Row(
          children: [
            Image.asset('assets/images/wifi_icon2.png'),
            SizedBox(
              width: 5,
            ),
            Text(
              _character == 0 ? 'Connected' : 'Not Connected',
              style: TextStyle(fontSize: 18, 
               color: _character == 0 ? Hexcolor("#00B074") : Colors.red),
            ),
          ],
        ),
      ]),
    );
  }

// Speedo Meter widget
  Widget _speedoMeterWidget() {
    return Container(
        height: 320,
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 100, ranges: <GaugeRange>[
            GaugeRange(startValue: 0, endValue: _character ==0 ? widget.actualData['devices'][0]['connectionStatus']['dataFlowGB'] : 0, color: Colors.green),
            GaugeRange(startValue: 100, endValue: 100, color: Colors.orange),
            GaugeRange(startValue: 100, endValue: 100, color: Colors.red)
          ], pointers: <GaugePointer>[
            NeedlePointer(value: _character ==0 ? widget.actualData['devices'][0]['connectionStatus']['dataFlowGB'] : 0)
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Container(
                  child: Column(
                    children: [
                      Text(
                        'Remaining',
                        style:
                            TextStyle(fontSize: 12, color: Hexcolor("#9D9D9C")),
                      ),
                      Text(
                        _character == 0 ?(widget.actualData['devices'][0]['connectionStatus']['dataFlowGB']).toStringAsFixed(3):
                        '0 MB',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Global 5GB',
                        style:
                            TextStyle(fontSize: 12, color: Hexcolor("#9D9D9C")),
                      ),
                      SizedBox(
                        height: 150,
                      ),
                      _packageWidget(),
                    ],
                  ),
                ),
                angle: 90,
                positionFactor: 0.25)
          ])
        ]));
  }

// DIVIDER Container
  Widget _dividerWidget() {
    return Divider(
      color: Colors.grey,
      indent: 1,
      endIndent: 1,
    );
  }

  // _connectionTitleWidget
  Widget _connectionTitleWidget() {
    return Center(
      child: Text(
        'Connection Details',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

//  NavigateWidget
  Widget _navigateWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Settings(actualData: widget.actualData)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Image.asset(
          'assets/images/settings_icon.png',
          height: 50,
          width: 50,
        ),
      ),
    );
  }

// PACKAGES WIDGET
  Widget _packageWidget() {
    return InkWell(
      onTap: () {
        _dataPackagesWidget();
      },
      child: Container(
        width: 120,
        height: 50,
        margin: EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        // padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Hexcolor("#6E0F24")),
        child: ButtonBar(
          children: <Widget>[
            FlatButton(
              child: Text(
                "Packages",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              onPressed: _toggleTab,
            ),
          ],
        ),
      ),
    );
  }

//  _countryInfoRightWidget
  Widget _countryInfoRightWidget() {
    return Container(
      child: Row(
        children: [
          Image.asset('assets/images/wifi_icon2.png'),
          SizedBox(width: 8),
          Text(
            _character ==0 ?
            widget.actualData['devices'][0]['connectionStatus']['signalQuality']:
            'Not Connected',
            style: TextStyle(color: _character !=0 ? Colors.red :Colors.green ),
            )
        ],
      ),
    );
  }

//  COUNTRRY INFO
  Widget _countryInfoWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Hexcolor("#707070")),
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.white),
      child: Stack(
        children: [
          Row(children: [
            SizedBox(
              width: 20,
            ),
            _character==0 ? Image.asset('assets/images/sg-flag-icon.png'):
             Image.asset('assets/images/usa_icon.png'),
            SizedBox(
              width: 20,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Country',
                  style: TextStyle(
                    fontSize: 12,
                    color: Hexcolor('#9D9D9C'),
                  )),
              Text(
                _character == 0 ? widget.actualData['devices'][0]['connectionStatus']['country']:
                '--', 
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
            ])
          ]),
          Positioned(
            child: _countryInfoRightWidget(),
            right: 10,
            top: 8,
          )
        ],
      ),
    );
  }
// _contectionDetatilsWidget

  Widget _contectionDetatilsWidget() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/images/yellow_icon.png'),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 23),
                Text(
                   'Connected Since',
                  style: TextStyle(fontSize: 12, color: Hexcolor('#9D9D9C')),
                ),
                SizedBox(height: 3),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    _character == 0 ? widget.actualData['devices'][0]['connectionStatus']['connectedAt']:
                     '0',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                )
              ],
            )
          ]),
          Flexible(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset('assets/images/blue_icon.png'),
              SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 23),
                    Text(
                      'Length of session',
                      style: TextStyle(fontSize: 12, color: Hexcolor('#9D9D9C')),
                    ),
                    SizedBox(height: 3),
                    Text(
                      '0',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    )
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
      // 2nd COL
      Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: [
            Image.asset('assets/images/pink_icon.png'),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 23),
                Text(
                  'Data Consumed',
                  style: TextStyle(fontSize: 12, color: Hexcolor('#9D9D9C')),
                ),
                SizedBox(height: 3),
                Text(
                 _character ==0 ? (widget.actualData['devices'][0]['connectionStatus']['dataFlowGB']).toStringAsFixed(3)
                 : '0 MB',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                )
              ],
            )
          ]),
          Flexible(
            child: Row(

              children: [
              SizedBox(width: 80),
              Image.asset('assets/images/green_icon.png'),
              SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 23),
                    Text(
                      'Connected Devices',
                      style: TextStyle(fontSize: 12, color: Hexcolor('#9D9D9C')),
                    ),
                    SizedBox(height: 3),
                    Text(
                      _character == 0 ? (widget.actualData['devices'][0]['connectionStatus']['connectedDevices']).toString(): 
                       '0',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    )
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    ]);
  }
// _connection Widget

  Widget _connectionWidget() {
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: <Widget>[
        SizedBox(
          height: 20,
        ),
        _dropUpWidget(),
        SizedBox(
          height: 20,
        ),
        _infoDataWidget(),
        SizedBox(
          height: 10,
        ),
        _dividerWidget(),
        _speedoMeterWidget(),
        _dividerWidget(),
        SizedBox(height: 5),
        _connectionTitleWidget(),
        SizedBox(height: 10),
        _countryInfoWidget(),
        _contectionDetatilsWidget()
      ]),
    ));
  }

  Widget _dataPackagesWidget() {
    return SingleChildScrollView(
        child: Container(
      color: Hexcolor("#F0F1F6"),
      // padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: <Widget>[
        SizedBox(
          height: 0.5,
        ),
        _speedoMeterWidgetDP(),
        // _dividerWidget(),
        SizedBox(height: 20),
        _availablePackageWidget(),
        SizedBox(height: 10),
        Container(
          // color: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _availablePackageListWidget(),
              // _contectionDetatilsWidget(),
            ],
          ),
        ),
      ]
      ),
    ));
  }
//  DropUp Widget

  Widget _dropUpWidget() {
      void _handleRadioValueChanged(int value) {
    setState(() {
      _character = value;
      Navigator.pop(context);
    });
  }
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
              // borderRadius: BorderRadius.circular(25.0),
               borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),),
            ),
            context: context,
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    // height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Devices',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                  new Divider(
                    color: Colors.black,
                  ),
                   Container(
                    height: 150,
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          leading: Image.asset('assets/images/wifi_icon.png'),
                          title:Text( widget.actualData['devices'][0]['name']),
                          trailing: Row(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio(
                                  activeColor: Hexcolor('#C2D22B'),
                                  value: 0,
                                  groupValue: _character,
                                  onChanged: _handleRadioValueChanged,
                                  ),
                            ],
                          ),
                        ),
                new Divider(
                  color: Hexcolor('#5D6561'),
                  thickness: 0,
                  indent: 10,
                  endIndent: 20,
                  height: 0,
                ),
                ListTile(
                  leading: Image.asset('assets/images/wifi_icon.png'),
                  title:Text( widget.actualData['devices'][1]['name']),
                  trailing: Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio(
                          activeColor: Hexcolor('#C2D22B'),
                          value: 1,
                          groupValue: _character,
                          onChanged: _handleRadioValueChanged,
                          ),
                    ],
                  ),
                ),
                new Divider(
                  color: Hexcolor('#5D6561'),
                  thickness: 0,
                  indent: 10,
                  endIndent: 20,
                  height: 0,
                ),
              ],
            ),
          )
                      ],
                    );
          }
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Hexcolor("#707070")),
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.white),
        child: Stack(
          children: [
            Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset('assets/images/wifi_icon.png'),
                  SizedBox(
                    width: 20,
                  ),
                  Text('WIFI',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ]),
            Positioned(
              child: Image.asset('assets/images/down_arrow_icon.png'),
              right: 10,
              top: 8,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('hon=== ${widget.actualData['devices'][0]['dataPackages'][0]}');
    return AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor),
        duration: Duration(milliseconds: 250),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(100),
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  child: AppBar(
                    leading: _drawerWidget(),
                    title: Image.asset('assets/images/home_logo.png',
                        height: 100, width: 100),
                    backgroundColor: Hexcolor('#6E0F24'),
                    actions: <Widget>[
                      _navigateWidget(),
                    ],
                    bottom: TabBar(
                      controller: _tabController,
                      indicator: UnderlineTabIndicator(
                        insets: EdgeInsets.only(
                          left: 20,
                          right: 30,
                        ),
                      ),
                      indicatorPadding: EdgeInsets.only(top: 50),
                      indicatorWeight: 3.0,
                      indicatorColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelPadding: EdgeInsets.symmetric(horizontal: 60),
                      isScrollable: true,
                      labelColor: Hexcolor("#C2D21D"),
                      unselectedLabelColor: Colors.white,
                      tabs: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text('Connection'),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text('Data packages'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  _connectionWidget(),
                  _dataPackagesWidget(),
                ],
              ),
            ),
          ),
        ));
  }
}

