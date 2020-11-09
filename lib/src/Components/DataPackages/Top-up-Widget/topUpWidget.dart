import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:unniTel/src/Components/DataPackages/PaymentMethod/payment.dart';

class TopUpWidget extends StatefulWidget {
  final actualData;
  final selectedDevice;
  const TopUpWidget({this.selectedDevice, this.actualData});
  @override
  _TopUpWidgetState createState() => _TopUpWidgetState();
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

class _TopUpWidgetState extends State<TopUpWidget> {
  int _value = 1;
  int _selectedGB = 1;
  int _setPrice = 8;
  List<ListItem> _dropdownItems = [
    ListItem(1, "5GB"),
    ListItem(2, "10GB"),
    ListItem(3, "15GB"),
    ListItem(4, "20GB")
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  // ignore: unused_field
  ListItem _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

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
                  padding: EdgeInsets.only(left: 0, top: 12, bottom: 10),
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

  Widget _credientialWidget() {
    return Container(
      child: Column(children: <Widget>[
        _selectPackages('Region'),
        SizedBox(height: 20),
        _selectPackagesData('Package Size'),
        SizedBox(height: 20),
        _showPrices(),
        SizedBox(height: 20),
        _devicesWidget('Device'),
      ]),
    );
  }

  // Selected Packages Widget
  Widget _selectPackages(String title) {
    final regionFieldIndex0 = widget.actualData['devices'][0]['dataPackages'][0]['goodsName'].split(' ');
    final regionFieldIndex1 = widget.actualData['devices'][1]['dataPackages'][0]['goodsName'].split(' ');
    final _regionDataIndex0 = regionFieldIndex0[0];
    final _regionDataIndex1 = regionFieldIndex1[0];
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: TextStyle(color: Hexcolor('#9D9D9C'), fontSize: 16,fontFamily: 'CircularStd-Book'),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              border: Border.all(width: 1, color: Hexcolor('#DEDEDE'))),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
                value: _value,
                items: [
                  DropdownMenuItem(
                    child: Text(
                      _regionDataIndex1,
                      //  widget.selectedDevice ==0 ? _regionDataIndex0:
                      //   _regionDataIndex1,
                    style: TextStyle(fontSize: 14,fontFamily: 'CircularStd-Medium'),),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      _regionDataIndex0,
                      style: TextStyle(fontSize: 14, fontFamily: 'CircularStd-Medium'),
                    ),
                    value: 2,
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                }),
          ),
        ),
      ]),
    );
  }

  Widget _selectPackagesData(String title) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: TextStyle(color: Hexcolor('#9D9D9C'), fontSize: 16, fontFamily: 'CircularStd-Book'),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              border: Border.all(width: 1, color: Hexcolor('#DEDEDE'))),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
                value: _selectedGB,
                items: [
                  DropdownMenuItem(
                    child: Text(
                      // _selectedGBAtIndex0[1]
                      "1GB",
                      style: TextStyle(fontSize: 14,fontFamily: 'CircularStd-Medium'),
                    ),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      // _selectedGBAtIndex1[1]
                      "3GB",
                       style: TextStyle(fontSize: 14,fontFamily: 'CircularStd-Medium'),
                    ),
                    value: 2,
                  ),
                   DropdownMenuItem(
                    child: Text(
                      // _selectedGBAtIndex1[1]
                      "5GB",
                       style: TextStyle(fontSize: 14,fontFamily: 'CircularStd-Medium'),
                    ),
                    value: 3,
                  ),
                   DropdownMenuItem(
                    child: Text(
                      // _selectedGBAtIndex1[1]
                      "10GB",
                       style: TextStyle(fontSize: 14,fontFamily: 'CircularStd-Medium'),
                    ),
                    value: 4,
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedGB = value;
                  });
                }),
          ),
        ),
      ]),
    );
  }

  Widget _showPrices() {
    // For Asia
    if(_value == 2) {
      if (_selectedGB == 1) {
        setState(() {
          _setPrice = 5;
        });
      } else if (_selectedGB == 2) {
        setState(() {
          _setPrice = 15;
        });
      }else if (_selectedGB == 3) {
        setState(() {
          _setPrice = 25;
        });
      }else if (_selectedGB == 4) {
        setState(() {
          _setPrice = 50;
        });
      }
    }
    // For Global
    else if (_value == 1) {
      if (_selectedGB == 1) {
        setState(() {
          _setPrice = 8;
        });
      } else if (_selectedGB == 2) {
        setState(() {
          _setPrice = 24;
        });
      }else if (_selectedGB == 3) {
        setState(() {
          _setPrice = 40;
        });
      }else if (_selectedGB == 4) {
        setState(() {
          _setPrice = 80;
        });
      }
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 1, color: Hexcolor('#DEDEDE')),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Price',
            style: TextStyle(fontSize: 16, color: Hexcolor("#9D9D9C"), fontFamily: 'CircularStd-Book'),
          ),
          Text(
            'US\$' + (_setPrice).toString(),
            style: TextStyle(fontSize: 18,fontFamily: 'CircularStd-Bold', color: Hexcolor("#C2D21D")),
          )
        ],
      ),
    );
  }

  Widget _devicesWidget(String title) {
    return Container(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
        Text(
          title,
          style: TextStyle(color: Hexcolor('#9D9D9C'), fontSize: 16,fontFamily: 'CircularStd-Book')
        ),
        SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 1, color: Hexcolor('#DEDEDE')),
          color: Colors.white),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Image.asset('assets/images/wifi_icon.png'),
         SizedBox(width: 8),
          Text(
            widget.selectedDevice == 0 ?  widget.actualData['devices'][0]['name']:
             widget.actualData['devices'][1]['name'],
            style: TextStyle(fontSize: 14,fontFamily: 'CircularStd-Medium',color: Colors.black),
          )
        ],
      ),
          )
        ]
      )
    );
  }

  Widget _savePassWidget() {
    return InkWell(
      onTap: () {
        // Navigate to payment Widget
        Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(selectedDevice: widget.selectedDevice,actualData : widget.actualData,quantity: _selectedGB, price:_setPrice )));
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
          'Add to Cart',
          style: TextStyle(fontSize: 20,fontFamily: 'CircularStd-Medium', color: Colors.white),
        ),
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
              'Top Up',
              style: TextStyle(fontSize: 20,
              fontFamily: 'CircularStd-Bold',
               color: Colors.black),
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
                    height: 0,
                    color: Hexcolor('#5D6561'),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _credientialWidget(),
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
                      children: [_savePassWidget()],
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
