import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ManageDevices extends StatefulWidget {
  @override
  _ManageDevicesState createState() => _ManageDevicesState();
}

class _ManageDevicesState extends State<ManageDevices> {
  // Back arraow widget
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

  // Add New Device Widget
  Widget _addNewDeviceWidget() {
    return InkWell(
      onTap: () {
        // if (_formKey.currentState.validate()) {
        //   _formKey.currentState.save();
        //   toastMessage('New Password Save Successfully');
        //   Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => MainScreen()));
        // }
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

  // Manage Devices List
  Widget _devicesList() {
    return Container(
      height: 500,
      child: ListView(
        children: <Widget>[
          ListTile(
              leading: Image.asset('assets/images/wifi_icon.png'),
              title: Text('Notification Settings'),
              subtitle: Text('SSID:'),
              trailing: IconButton(
                  icon: Icon(Icons.arrow_right_sharp),
                  onPressed: () {
                    //  Navigator.push(context, MaterialPageRoute(builder: (context)=> NotificationScreen()));
                  })),
          new Divider(
            color: Hexcolor('#5D6561'),
            thickness: 0,
            indent: 10,
            endIndent: 20,
          ),
          ListTile(
              leading: Image.asset('assets/images/wifi_icon.png'),
              title: Text('Change password'),
              subtitle: Text('SSID:'),
              trailing: IconButton(
                  icon: Icon(Icons.arrow_right_sharp),
                  onPressed: () {
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassword()));
                  })),
          new Divider(
            color: Hexcolor('#5D6561'),
            thickness: 0,
            indent: 10,
            endIndent: 20,
          ),
          ListTile(
              leading: Image.asset('assets/images/wifi_icon.png'),
              title: Text('Change Particulars'),
              subtitle: Text('SSID:'),
              trailing: IconButton(
                  icon: Icon(Icons.arrow_right_sharp),
                  onPressed: () {
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                  })),
         new Divider(
            color: Hexcolor('#5D6561'),
            thickness: 0,
            indent: 10,
            endIndent: 20,
          ),
          ListTile(
              leading: Image.asset('assets/images/wifi_icon.png'),
              title: Text('Help'),
              subtitle: Text('SSID:'),
              trailing: IconButton(
                  icon: Icon(Icons.arrow_right_sharp), onPressed: () {})
                  ),
        new Divider(
            color: Hexcolor('#5D6561'),
            thickness: 0,
            indent: 10,
            endIndent: 20,
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
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
