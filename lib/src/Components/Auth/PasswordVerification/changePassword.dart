import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:unniTel/src/Components/mainScreen.dart';

class ChangePassword extends StatefulWidget {
  final actualData;
  const ChangePassword({this.actualData});
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String _oldPass, _newPass, _confirmPass = '';
  final TextEditingController _oldPassCntrl = TextEditingController();
  final TextEditingController _newPassCntrl = TextEditingController();
  final TextEditingController _newConfrimedPassCntrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  FocusNode _oldPasswordFocus = FocusNode();
  FocusNode _newPasswordFocus = FocusNode();
  FocusNode _confirmPasswordFocus = FocusNode();
  // CREDIENTIAL WIDGET
  Widget _credientialWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _oldPasswordField("Old Password"),
          _newPasswordField("New Password"),
          _confirmPasswordField("Confirm Password"),
        ],
      ),
    );
  }

  // NEW PASSWORD FILD WIDGET
  Widget _oldPasswordField(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 13, color: Colors.black45),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              // controller: _newPassCntrl,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true,
                hintText: '*******',
              ),
              validator: (value) {
                Pattern pattern =
                    r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
                RegExp regExp = new RegExp(pattern);
                if (value.isEmpty) {
                  return "Please Enter New Password";
                } else if (!regExp.hasMatch(value)) {
                  return "Invalid Password";
                }
                return null;
              },
              onSaved: (value) => _oldPass = value,
              autofocus: true,
              focusNode: _oldPasswordFocus,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              onFieldSubmitted: (_) {
                fieldFocusNode(context, _oldPasswordFocus, _newPasswordFocus);
              },
              obscureText: true,
            )
          ]),
    );
  }

  // NEW PASSWORD FILD WIDGET
  Widget _newPasswordField(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 13, color: Colors.black45),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: _newPassCntrl,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true,
                hintText: '*******',
              ),
              validator: (value) {
                Pattern pattern =
                    r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
                RegExp regExp = new RegExp(pattern);
                if (value.isEmpty) {
                  return "Please Enter New Password";
                } else if (!regExp.hasMatch(value)) {
                  return "Invalid Password";
                }
                return null;
              },
              onSaved: (value) => _newPass = value,
              focusNode: _newPasswordFocus,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              onFieldSubmitted: (_) {
                fieldFocusNode(
                    context, _newPasswordFocus, _confirmPasswordFocus);
              },
              obscureText: true,
            )
          ]),
    );
  }

  // CONFIRM PASSWORD FIELD WIDGET
  Widget _confirmPasswordField(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 13, color: Colors.black45),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: _newConfrimedPassCntrl,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true,
                hintText: '*******',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Enter confirm Password";
                } else if (value != _newPassCntrl.text) {
                  return 'Password Not Match';
                }
                return null;
              },
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              focusNode: _confirmPasswordFocus,
              obscureText: true,
            )
          ]),
    );
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

  // Save Password Widget
  Widget _savePassWidget() {
    return InkWell(
      onTap: () {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          toastMessage('New Password Save Successfully');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainScreen(res: widget.actualData,)));
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
          'Save',
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
              'Change Password',
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

// CHANGE FOCUS NODE
void fieldFocusNode(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

//  TOAST METHOD
void toastMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      fontSize: 16,
      backgroundColor: Colors.greenAccent,
      textColor: Colors.black);
}
