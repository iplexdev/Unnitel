import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:unniTel/src/Components/Auth/PasswordVerification/verifyPassword.dart';
class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  // BACK WIDGET
  Widget _backWidget() {
    return GestureDetector(
      onTap:() {
        Navigator.pop(context);
      },
       child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children:<Widget>[
            Container(
              padding: EdgeInsets.only(left:0,top:10,bottom:10),
              child: 
              // Icon(
              //   Icons.keyboard_arrow_left,
              //   color: Colors.black,
              //   ),
              Image.asset('assets/images/back-arrow-icon.png')
            ),
          ]
        ),
      ),
    );
  }
  // LOGO WIDGET
  _logoWidget() {
    return Container(
      child: Image(
        image: AssetImage(
          'assets/images/img_logo_unnitel.png'
        ),
        height: 50,
      ),
    );
  }
  // TITLE WIDGET
   Widget _titleWidget() {
     return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
         text: 'Forgot Password',
            style: TextStyle(
              fontSize:20,
              fontFamily: 'CircularStd-Medium',
              color:Colors.black
              ),
      )
    );
  }
  // CREADIENTIAL WIDGET
  Widget _credientialWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children:<Widget>[
          _forgotPasswordField('Email'),
        ]
      ),
    );
  }
  // FORGOT PASSWORD FILED
  Widget _forgotPasswordField(String title) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'CircularStd-Book',
              color: Colors.black45,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Color(0xfff3f3f4),
              filled: true,
              hintText: 'example@example.com',
              hintStyle: TextStyle(fontSize:16)
            ),
            style: TextStyle(fontSize: 18, fontFamily:'CircularStd-Medium', color:Colors.black),
            validator: (email) => EmailValidator.validate(email)?null: 'Invalid Email',
           keyboardType: TextInputType.emailAddress,
           textInputAction: TextInputAction.done,
          //  autofocus: true,
          ),
        ],
      ),
    );
  }
  // SEND FORGOT WIDGET
  Widget _sendForgotWidget() {
    return InkWell(
      onTap: () {
          if(_formKey.currentState.validate()) {
              _formKey.currentState.save();
                toastMessage("Email Send Successfully");
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => VerifyPassword()
                )
                );
          }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical:15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.lime[600],
          ),
          child: Text(
            'Send',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'CircularStd-Medium',
              color: Colors.white
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
       resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding:false,
       body: Container(
           height: height,
           child: Stack(
             children: <Widget>[
               Positioned(
                 top:30,
                 left:10,
                 child: _backWidget(),
               ),
               Container(
                 padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
            //  mainAxisAlignment: MainAxisAlignment.center,
             children:<Widget>[
                    SizedBox(
                      height: height * .1,
                    ),
                    _logoWidget(),
                    SizedBox(
                      height: 20
                    ),
                    _titleWidget(),
                    SizedBox(
                      height: 50,
                    ),
                    _credientialWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _sendForgotWidget(),
             ]
           ),
               ),
             ],
           )
       ),
     ),
    //  child:Container(
    //    height: MediaQuery.of(context).size.height,
    //    child:Text(
    //      'hello Forgot password'
    //    )
    //  )
   );
  }
}
// TOAST METHOD
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