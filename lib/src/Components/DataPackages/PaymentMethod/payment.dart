import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:unniTel/src/Components/DataPackages/PaymentMethod/congratulation.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool isSwitched = false;
  String _cardNo, _month, _year, _secCode, _fname, _lname = '';
  final TextEditingController _codeNoCntrl = TextEditingController();
  final TextEditingController _monthCntrl = TextEditingController();
  final TextEditingController _yearCntrl = TextEditingController();
  final TextEditingController _secCntrl = TextEditingController();
  final TextEditingController _fnameCntrl = TextEditingController();
  final TextEditingController _lnameCntrl = TextEditingController();
  FocusNode _cardNoFocus = FocusNode();
  FocusNode _monthFocus = FocusNode();
  FocusNode _yearFocus = FocusNode();
  FocusNode _secFocus = FocusNode();
  FocusNode _fnameFocus = FocusNode();
  FocusNode _lnameFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cardNoCntrl = TextEditingController();
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

// TITLE WIDGET
  Widget _titleWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            // spreadRadius: 5,
            blurRadius: 7,
            // offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
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
                      padding: const EdgeInsets.only(left: 70),
                      child: Flexible(
                        child: FDottedLine(
                          color: Hexcolor("#F0F1F6"),
                          height: 60.0,
                          dottedLength: 4,
                          space: 2,
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 8.0),
                      Flexible(
                        child: Container(
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
                            'Edit',
                            style: TextStyle(
                                color: Hexcolor('#00B074'), fontSize: 12.0),
                          ),
                        ),
                      ),
                    // )
                  ],
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }

// Payment Method Widget
  Widget _paymentMethodWidget() {
    return Container(
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Payment Details',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          ),
          SizedBox(height: 25),
          _cardDetails()
        ]),
      ),
    );
  }

// Payment Form Widget
  _cardDetails() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _cardNumberField('Card Number'),
          SizedBox(height: 24),
          _cardYearWidget('Month', 'Year'),
          SizedBox(height: 24),
          _cardSecurityCodeWidget('Security Code'),
          SizedBox(height: 24),
          _fullNameWidget('First Name', 'Last Name'),
          SizedBox(height: 30),
          _allowPermissionWidget('Save this card'),
        ],
      ),
    );
  }

// Card Number Field
  Widget _cardNumberField(String title) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: TextStyle(fontSize: 14, color: Hexcolor('#9D9D9C')),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: _cardNoCntrl,
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Color(0xfff3f3f4),
            filled: true,
            hintText: '111222233334444',
          ),
          validator: (value) {
            RegExp regExp = new RegExp(r'^[0-9]*$');
            if (value.isEmpty) {
              return "Please Enter Number";
            } else if (!regExp.hasMatch(value)) {
              return "Invalid Phone Number";
            } else if (_cardNoCntrl.text.length <= 14) {
              return "Invalid";
            }
            return null;
          },
          onSaved: (value) => _cardNo = value,
          autofocus: true,
          inputFormatters: [
            // ignore: deprecated_member_use
            WhitelistingTextInputFormatter.digitsOnly
          ],
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          focusNode: _cardNoFocus,
          onFieldSubmitted: (_) {
            fieldFocusNode(context, _cardNoFocus, _monthFocus);
          },
        ),
      ]),
    );
  }

// MONTH WIDGET
  Widget _cardYearWidget(String month, String year) {
    return Container(
      child: Row(
        children: [
          Flexible(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(month,
                  style: TextStyle(fontSize: 14, color: Hexcolor('#9D9D9C'))),
              SizedBox(height: 10),
              TextFormField(
                controller: _monthCntrl,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true,
                  hintText: 'Month',
                ),
                validator: (value) {
                  RegExp regExp = new RegExp(r'^[0-9]*$');
                  if (value.isEmpty) {
                    return "Please Enter Number";
                  } else if (!regExp.hasMatch(value)) {
                    return "Invalid Phone Number";
                  } else if (_monthCntrl.text.length <= 1 ||
                      _monthCntrl.text.length >= 3) {
                    return "Invalid please type two digit";
                  }
                  return null;
                },
                onSaved: (value) => _month = value,
                inputFormatters: [
                  // ignore: deprecated_member_use
                  WhitelistingTextInputFormatter.digitsOnly
                ],
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _monthFocus,
                onFieldSubmitted: (_) {
                  fieldFocusNode(context, _monthFocus, _yearFocus);
                },
              ),
            ]),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(year,
                        style: TextStyle(
                            fontSize: 14, color: Hexcolor('#9D9D9C'))),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _yearCntrl,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xfff3f3f4),
                        filled: true,
                        hintText: 'Year',
                      ),
                      validator: (value) {
                        RegExp regExp = new RegExp(r'^[0-9]*$');
                        if (value.isEmpty) {
                          return "Please Enter Number";
                        } else if (!regExp.hasMatch(value)) {
                          return "Invalid Phone Number";
                        } else if (_yearCntrl.text.length <= 3 ||
                            _yearCntrl.text.length >= 5) {
                          return "Invalid please type four digit";
                        }
                        return null;
                      },
                      onSaved: (value) => _year = value,
                      inputFormatters: [
                        // ignore: deprecated_member_use
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      focusNode: _yearFocus,
                      onFieldSubmitted: (_) {
                        fieldFocusNode(context, _yearFocus, _secFocus);
                      },
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

// CARD SECURITY CODE
  Widget _cardSecurityCodeWidget(String code) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(code, style: TextStyle(fontSize: 14, color: Hexcolor('#9D9D9C'))),
        SizedBox(height: 10),
        TextFormField(
          controller: _secCntrl,
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Color(0xfff3f3f4),
            filled: true,
            hintText: 'Enter Security Code',
          ),
          validator: (value) {
            RegExp regExp = new RegExp(r'^[0-9]*$');
            if (value.isEmpty) {
              return "Please Enter Number";
            } else if (!regExp.hasMatch(value)) {
              return "Invalid Phone Number";
            } else if (_secCntrl.text.length <= 5 ||
                _secCntrl.text.length >= 7) {
              return "Invalid";
            }
            return null;
          },
          onSaved: (value) => _secCode = value,
          inputFormatters: [
            // ignore: deprecated_member_use
            WhitelistingTextInputFormatter.digitsOnly
          ],
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          focusNode: _secFocus,
          onFieldSubmitted: (_) {
            fieldFocusNode(context, _secFocus, _fnameFocus);
          },
        ),
      ]),
    );
  }

  // FULL NAME WIDGET
  Widget _fullNameWidget(String fname, String lname) {
    return Container(
      child: Row(
        children: [
          Flexible(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(fname,
                  style: TextStyle(fontSize: 14, color: Hexcolor('#9D9D9C'))),
              SizedBox(height: 10),
              TextFormField(
                controller: _fnameCntrl,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true,
                  hintText: 'First Name',
                ),
                validator: (value) {
                  RegExp regExp = new RegExp(r'^[a-z]*$');
                  if (value.isEmpty) {
                    return "Please Enter Name";
                  } else if (!regExp.hasMatch(value)) {
                    return "Invalid Name";
                  } else if (_fnameCntrl.text.length <= 4) {
                    return "Invalid Name";
                  }
                  return null;
                },
                onSaved: (value) => _fname = value,
                inputFormatters: [
                  // ignore: deprecated_member_use
                  new WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),
                ],
                focusNode: _fnameFocus,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                onFieldSubmitted: (_) {
                  fieldFocusNode(context, _fnameFocus, _lnameFocus);
                },
              ),
            ]),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(lname,
                        style: TextStyle(
                            fontSize: 14, color: Hexcolor('#9D9D9C'))),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _lnameCntrl,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xfff3f3f4),
                        filled: true,
                        hintText: 'Last Name',
                      ),
                      validator: (value) {
                        RegExp regExp = new RegExp(r'^[a-zA-Z]*$');
                        if (value.isEmpty) {
                          return "Please Enter Name";
                        } else if (!regExp.hasMatch(value)) {
                          return "Invalid LastName";
                        } else if (_lnameCntrl.text.length <= 4) {
                          return "Invalid";
                        }
                        return null;
                      },
                      onSaved: (value) => _lname = value,
                      inputFormatters: [
                        // ignore: deprecated_member_use
                        new WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),
                      ],
                      focusNode: _lnameFocus,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  // ALLOW PERMISSION WIDGET
  Widget _allowPermissionWidget(String text) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(text,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Hexcolor('#000000'))),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('You can remove this card at anytime\n in Unnitel',
                style: TextStyle(fontSize: 14, color: Hexcolor('#9D9D9C'))),
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeTrackColor: Hexcolor('#C2D22B'),
              activeColor: Colors.white,
            ),
          ],
        )
      ]),
    );
  }

// Save Password Widget
  Widget _playNowWidget() {
    return InkWell(
      onTap: () {
        if (_formKey.currentState.validate() && isSwitched) {
          _formKey.currentState.save();
          toastMessage('Save Successfully', isSwitched);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Congratulation()));
        } else {
          toastMessage('Please check Save this card', isSwitched);
        }
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
          'Play Now',
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
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Column(
                  children: [
                    new Divider(
                      height: 0,
                      color: Hexcolor('#5D6561'),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _titleWidget(),
                          SizedBox(
                            height: 20,
                          ),
                          new Divider(
                            height: 0,
                            color: Hexcolor('#DEDFE0'),
                          ),
                          SizedBox(height: 19),
                          _paymentMethodWidget(),
                          SizedBox(height: 10),
                          _playNowWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// CHANGE FOCUS NODE
void fieldFocusNode(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

//  TOAST METHOD
void toastMessage(String message, bool enable) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: enable ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      fontSize: 16,
      backgroundColor: enable ? Colors.greenAccent : Colors.red,
      textColor: Colors.black);
}
