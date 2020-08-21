import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:unniTel/src/Components/Settings/setting.dart';

class HomeScreen extends StatefulWidget {
  final data;
  const HomeScreen({this.data});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

bool isEnable = false;

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawrEnable = false;
  TabController _tabController;
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  int _tabIndex = 0;
  void _toggleTab() {
    _tabIndex = _tabController.index + 1;
    _tabController.animateTo(_tabIndex);
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
                GaugeRange(startValue: 0, endValue: 10, color: Colors.green),
                GaugeRange(
                    startValue: 100, endValue: 100, color: Colors.orange),
                GaugeRange(startValue: 100, endValue: 100, color: Colors.red),
              ],
              pointers: <GaugePointer>[
                NeedlePointer(value: 10)
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
                            '10.0 MB',
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
        // Navigate to New Password Screen
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
                padding: const EdgeInsets.only(top: 20.0, left: 10, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '10GB No Expiry',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0),
                        ),
                        Text(
                          'Remaining Balance 7.33GB',
                          style: TextStyle(
                              color: Hexcolor('#9D9D9C'), fontSize: 12.0),
                        ),
                        Text(
                          'Purchase Date 2020.6.6',
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
                      width: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          color: Hexcolor('#E5F7F1')),
                      child: Text(
                        'in Use',
                        style: TextStyle(
                            color: Hexcolor('#00B074'), fontSize: 12.0),
                      ),
                    )
                  ],
                ),
              )),
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
                padding: const EdgeInsets.only(top: 20.0, left: 10, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Asia 03GB No Expiry',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0),
                        ),
                        Text(
                          'Remaining Balance 7.33GB',
                          style: TextStyle(
                              color: Hexcolor('#9D9D9C'), fontSize: 12.0),
                        ),
                        Text(
                          'Purchase Date 2020.6.6',
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
                        'Activated',
                        style: TextStyle(
                            color: Hexcolor('#C2D21D'), fontSize: 12.0),
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
          // USE STACK 3
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
                padding: const EdgeInsets.only(top: 20.0, left: 10, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Asia 03GB No Expiry',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0),
                        ),
                        Text(
                          'Remaining Balance 7.33GB',
                          style: TextStyle(
                              color: Hexcolor('#9D9D9C'), fontSize: 12.0),
                        ),
                        Text(
                          'Purchase Date 2020.6.6',
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
                        'Activated',
                        style: TextStyle(
                            color: Hexcolor('#C2D21D'), fontSize: 12.0),
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
          // USE STACK 4
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
                padding: const EdgeInsets.only(top: 20.0, left: 10, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Asia 03GB No Expiry',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0),
                        ),
                        Text(
                          'Remaining Balance 7.33GB',
                          style: TextStyle(
                              color: Hexcolor('#9D9D9C'), fontSize: 12.0),
                        ),
                        Text(
                          'Purchase Date 2020.6.6',
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
                        'Activated',
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
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          Image.asset('assets/images/battery_icon.png'),
          SizedBox(
            width: 5,
          ),
          Text(
            '70%',
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
              'Connected',
              style: TextStyle(fontSize: 18, color: Hexcolor("#00B074")),
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
            GaugeRange(startValue: 0, endValue: 10, color: Colors.green),
            GaugeRange(startValue: 100, endValue: 100, color: Colors.orange),
            GaugeRange(startValue: 100, endValue: 100, color: Colors.red)
          ], pointers: <GaugePointer>[
            NeedlePointer(value: 10)
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
                        '10.0 MB',
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
            context, MaterialPageRoute(builder: (context) => Settings()));
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
          Text('Good')
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
              Text('United State',
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
                Text(
                  '11:45 am, 11 jun',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                )
              ],
            )
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/images/blue_icon.png'),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 23),
                Text(
                  'Length of session',
                  style: TextStyle(fontSize: 12, color: Hexcolor('#9D9D9C')),
                ),
                SizedBox(height: 3),
                Text(
                  '3d : 8h : 11min 21s',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                )
              ],
            )
          ]),
        ],
      ),
      // 2nd COL
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                  '10 MB',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                )
              ],
            )
          ]),
          Row(children: [
            SizedBox(width: 80),
            Image.asset('assets/images/green_icon.png'),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 23),
                Text(
                  'Connected Devices',
                  style: TextStyle(fontSize: 12, color: Hexcolor('#9D9D9C')),
                ),
                SizedBox(height: 3),
                Text(
                  '09',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                )
              ],
            )
          ]),
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
        )
      ]),
    ));
  }
//  DropUp Widget

  Widget _dropUpWidget() {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
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
                    height: 300,
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                            leading: Image.asset('assets/images/wifi_icon.png'),
                            title: Text('Huawei Wifi'),
                            trailing: IconButton(
                                icon: Icon(isEnable
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_off_rounded),
                                onPressed: () {
                                  setState(() {
                                    if (isEnable) {
                                      print('on$isEnable');
                                      isEnable = false;
                                    } else {
                                      print('off$isEnable');
                                      isEnable = true;
                                    }
                                  });
                                })),
                        new Divider(
                          color: Colors.black,
                          thickness: 0,
                          indent: 18,
                          endIndent: 18,
                        ),
                        ListTile(
                            leading: Image.asset('assets/images/wifi_icon.png'),
                            title: Text('EMobile Device'),
                            trailing: IconButton(
                                icon: Icon(isEnable
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_off_rounded),
                                onPressed: () {
                                  setState(() {
                                    if (isEnable) {
                                      print('on$isEnable');
                                      isEnable = false;
                                    } else {
                                      print('off$isEnable');
                                      isEnable = true;
                                    }
                                  });
                                })),
                        new Divider(
                          color: Colors.black,
                          thickness: 0,
                          indent: 18,
                          endIndent: 18,
                        ),
                        ListTile(
                            leading: Image.asset('assets/images/wifi_icon.png'),
                            title: Text('Zong 4G Device'),
                            trailing: IconButton(
                                icon: Icon(isEnable
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_off_rounded),
                                onPressed: () {
                                  setState(() {
                                    if (isEnable) {
                                      print('on$isEnable');
                                      isEnable = false;
                                    } else {
                                      print('off$isEnable');
                                      isEnable = true;
                                    }
                                  });
                                })),
                        new Divider(
                          color: Colors.black,
                          thickness: 0,
                          indent: 18,
                          endIndent: 18,
                        ),
                        ListTile(
                            leading: Image.asset('assets/images/wifi_icon.png'),
                            title: Text('Huawei 4G'),
                            trailing: IconButton(
                                icon: Icon(isEnable
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_off_rounded),
                                onPressed: () {
                                  setState(() {
                                    if (isEnable) {
                                      print('on$isEnable');
                                      isEnable = false;
                                    } else {
                                      print('off$isEnable');
                                      isEnable = true;
                                    }
                                  });
                                })),
                        new Divider(
                          color: Colors.black,
                          thickness: 0,
                          indent: 18,
                          endIndent: 18,
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
