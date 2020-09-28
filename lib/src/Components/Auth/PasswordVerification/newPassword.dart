import 'package:flutter/material.dart';
import 'package:unniTel/src/Components/Auth/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  String _newPass, _confirmPass = '';
  final TextEditingController _newPassCntrl = TextEditingController();
  final TextEditingController _newConfrimedPassCntrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  FocusNode _newPasswordFocus = FocusNode();
  FocusNode _confirmPasswordFocus = FocusNode();
  // BACK WIDGET
  Widget _backWidget() {
    return InkWell(
      onTap:() {
        Navigator.pop(context);
      },
       child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children:<Widget>[
            Container(
              padding: EdgeInsets.only(left:0,top:10,bottom:10),
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.black,
                ),
            ),
          ]
        ),
      ),
    );
  }
  // LOGO WIDGET
  Widget _logoWidget() {
    return Container(
      child: Image(
        image: AssetImage(
          'assets/images/img_logo_unnitel.png'
        ),
        height: 50
      ),
    );
  }
  //  TITLE WIDGET
  Widget _titleWidget() {
    return RichText(
      textAlign: TextAlign.center,
      text:TextSpan(
        text: "New Password",
        style: TextStyle(
          fontSize: 20,
          color: Colors.black
        ),
      )
    );
  }
  // CREDIENTIAL WIDGET
  Widget _credientialWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _newPasswordField("New Password"),
          _confirmPasswordField("Confirm Password"),
        ],
      ),
    );
  }
  // NEW PASSWORD FILD WIDGET
  Widget _newPasswordField(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children : <Widget>[
          Text(
            title,
            style:TextStyle(
              fontSize: 13,
              color: Colors.black45
            ),
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
              if (value.isEmpty){
                return "Please Enter New Password";
              } else if(_newPassCntrl.text.length< 6){
                return 'Invalid Password.Must have minimum of 6 character';
              }
              return null;
            },
            onSaved: (value) => _newPass= value,
            autofocus: true,
            focusNode: _newPasswordFocus,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            onFieldSubmitted: (_) {
              fieldFocusNode(context, _newPasswordFocus, _confirmPasswordFocus);
            },
            obscureText: true,
          )
        ]
      ),
    );
  }
  // CONFIRM PASSWORD FIELD WIDGET
  Widget _confirmPasswordField(String title) {
     return Container(
       margin: EdgeInsets.symmetric(vertical:10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children : <Widget>[
          Text(
            title,
            style:TextStyle(
              fontSize: 13,
              color: Colors.black45
            ),
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
              if(value.isEmpty) {
                return "Please Enter confirm Password";
              } else if(value != _newPassCntrl.text){
                return 'Password Not Match';
              }
              return null;
            },
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            focusNode: _confirmPasswordFocus,
            obscureText: true,
          )
        ]
      ),
    );
  }
  // SAVE NEW PASSWORD WIDGET
  Widget _saveNewPasswordWidget() {
    return InkWell(
      onTap: () {
        if(_formKey.currentState.validate()) {
          _formKey.currentState.save();
          toastMessage("New Password Created");
           Navigator.push(context,
       MaterialPageRoute(builder: (context) => LoginScreen())
       );
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical:15),
        decoration: BoxDecoration(
          borderRadius:BorderRadius.all(Radius.circular(12)),
          color: Colors.lime[600]
        ),
        child: Text(
          "Save",
          style:TextStyle(
            fontSize:20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
  // Main Widget
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
      return SafeArea(
        child: Scaffold(
          body: Container(
            height: height,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 30,
                  left: 0,
                  child: _backWidget(),
                ),
                Container(
                  child: SingleChildScrollView(
                     padding: EdgeInsets.symmetric(horizontal:20),
                    child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                      children:<Widget>[
                        SizedBox(
                          height: height * .1,
                        ),
                        _logoWidget(),
                        SizedBox(
                          height: 20,
                        ),
                        _titleWidget(),
                        SizedBox(
                          height: 40,
                        ),
                        _credientialWidget(),
                        SizedBox(
                          height: 30,
                        ),
                        _saveNewPasswordWidget(),
                     ]
                   ),
                  ),
                ),
              ],
            )
          )
        ),
      );
  }
}
// CHANGE FOCUS NODE
void fieldFocusNode(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
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
    textColor: Colors.black
  );
}