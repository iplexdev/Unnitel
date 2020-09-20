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
  int _deviceIndex = 1;
  List<ListItem> _dropdownItems = [
    ListItem(1, "5GB"),
    ListItem(2, "10GB"),
    ListItem(3, "15GB"),
    ListItem(4, "20GB")
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
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

  Widget _credientialWidget() {
    return Container(
      child: Column(children: <Widget>[
        _selectPackages('Select Whether'),
        SizedBox(height: 20),
        _selectPackagesData('Select GBs'),
        SizedBox(height: 20),
        _showPrices(),
        SizedBox(height: 20),
        _devicesWidget('Device'),
      ]),
    );
  }

  // Selected Packages Widget
  Widget _selectPackages(String title) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: TextStyle(color: Hexcolor('#9D9D9C'), fontSize: 16),
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
                       widget.selectedDevice ==0 ? widget.actualData['devices'][0]['dataPackages'][0]['goodsName']:
                        widget.actualData['devices'][1]['dataPackages'][0]['goodsName'],
                    ),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text(
                       widget.selectedDevice ==0 ? widget.actualData['devices'][0]['dataPackages'][1]['goodsName']:
                        widget.actualData['devices'][1]['dataPackages'][1]['goodsName'],
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
    final index0 = widget.selectedDevice == 0 ?
     widget.actualData['devices'][0]['dataPackages'][0]['goodsName']:
      widget.actualData['devices'][1]['dataPackages'][0]['goodsName'];
     final  _selectedGBAtIndex0= index0.split(' ');
     final _index1 = widget.selectedDevice == 0 ?
     widget.actualData['devices'][0]['dataPackages'][1]['goodsName']:
      widget.actualData['devices'][1]['dataPackages'][1]['goodsName'];
    final  _selectedGBAtIndex1= _index1.split(' ');
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: TextStyle(color: Hexcolor('#9D9D9C'), fontSize: 16),
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
                      _selectedGBAtIndex0[1]
                    ),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      _selectedGBAtIndex1[1]
                    ),
                    value: 2,
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
            style: TextStyle(fontSize: 16, color: Hexcolor("#9D9D9C")),
          ),
          Text(
            '\$20.0',
            style: TextStyle(fontSize: 18, color: Hexcolor("#C2D21D")),
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
          style: TextStyle(color: Hexcolor('#9D9D9C'), fontSize: 16),
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
            style: TextStyle(fontSize: 18,),
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(selectedDevice: widget.selectedDevice,actualData : widget.actualData)));
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
          style: TextStyle(fontSize: 20, color: Colors.white),
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
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'Top-Up',
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
