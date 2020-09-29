import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:unniTel/src/Components/mainScreen.dart';
class ManageDevices extends StatefulWidget {
  final accountData;
  const ManageDevices({this.accountData});
  @override
  _ManageDevicesState createState() => _ManageDevicesState();
}

// enum SingingCharacter { huaweiWifi, eMbile, zong, huawei4g }
bool isEnable = false;
int _character = 0;

class _ManageDevicesState extends State<ManageDevices> {
  // SingingCharacter _character = SingingCharacter.huaweiWifi;
  // Back arraow widget
  Widget _backArrowWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              // Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(res: widget.accountData,charcter: _character)));
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

// DONE NEW DEVICE BUTTON
  Widget _saveNewDevice() {
    return InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.lime[600],
          ),
          child: Text(
            'DONE',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ));
  }

  // Add New Device Widget
  Widget _addNewDeviceWidget() {
    return InkWell(
      onTap: () {
        // SHOW BOTTOM MODAL SHEET
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),),
            ),
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      // height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 100.0),
                            child: Text(
                              'ADD NEW DEVICE',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          IconButton(
                              icon: Icon(Icons.cancel_rounded),
                              onPressed: () => Navigator.pop(context))
                        ],
                      ),
                    ),
                    new Divider(
                      color: Hexcolor('#5D6561'),
                      height: 0,
                    ),
                    Container(
                      height: 300,
                      alignment: Alignment.topLeft,
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: Column(children: [
                        Column(children: [
                          new Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'SSID',
                              style: TextStyle(
                                  color: Hexcolor("#9D9D9C"), fontSize: 16),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      color: Hexcolor('#DEDEDE'), width: 1)),
                              hintText: 'Enter SSID',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please Enter SSID";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                          )
                        ]),
                        SizedBox(height: 10),
                        Column(children: [
                          new Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Passcode',
                                style: TextStyle(
                                    color: Hexcolor("#9D9D9C"), fontSize: 16)),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      color: Hexcolor('#DEDEDE'), width: 1)),
                              hintText: '*******',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please Enter Passcode";
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          )
                        ]),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: _saveNewDevice(),
                        )
                      ]),
                    )
                  ],
                ),
              );
            });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.lime[600],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
            Text(
              'Add New Device',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
 void _handleRadioValueChanged(int value) {
    setState(() {
      _character = value;
    });
  }
  // Manage Devices List
  Widget _devicesList() {
     
    return Container(
      height: 500,
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Image.asset('assets/images/wifi_icon.png'),
            title:Text( widget.accountData['devices'][0]['name'],style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal
            ),),
            subtitle: Row(
              children: [
                Text('SSID:', style: TextStyle(
                  fontSize: 14,
                  color: Hexcolor("#9D9D9C")
                ),),
                Flexible(
                  child: Text(
                    widget.accountData['devices'][0]['ssid'],
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                )
              ],
            ),
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
                IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {
                      //  Navigator.push(context, MaterialPageRoute(builder: (context)=> NotificationScreen()));
                    }),
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
            title:Text( widget.accountData['devices'][1]['name'],style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal
            ),),
            subtitle: Row(
              children: [
                Text('SSID:', style: TextStyle(
                  fontSize: 14,
                  color: Hexcolor("#9D9D9C")
                ),),
                Text(
                widget.accountData['devices'][1]['ssid'],
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.black))
              ],
            ),
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
                IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {
                      //  Navigator.push(context, MaterialPageRoute(builder: (context)=> NotificationScreen()));
                    }),
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
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'Manage Devices',
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
                    height: 0,
                    color: Hexcolor('#5D6561'),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _devicesList(),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50, left: 20, right: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Positioned(
                    child: Column(
                      //  crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [_addNewDeviceWidget()],
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
