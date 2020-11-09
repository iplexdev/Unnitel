import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:unniTel/src/Components/Auth/PasswordVerification/newPassword.dart';
class VerifyPassword extends StatefulWidget {
  @override
  _VerifyPasswordState createState() => _VerifyPasswordState();
}

class _VerifyPasswordState extends State<VerifyPassword> {
    // ignore: unused_field
    String _code;
    bool _onEditing = true;
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
  Widget _logoWidget() {
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
         text: 'Verification Code',
            style: TextStyle(
              fontSize:20,
              fontFamily: 'CircularStd-Medium',
              color:Colors.black
              ),
      )
    );
  }  
  // VERIFICATION CODE WIDGET
  Widget _verficationCodeWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          VerificationCode(
            length: 6,
            textStyle: TextStyle(
              fontSize:20,
              fontFamily: 'CircularStd-Medium',
              color:Colors.black,
            ),
            keyboardType: TextInputType.number,
            // autofocus: true,
            onCompleted: (String value) {
              setState(() {
                _code = value;
              });
            },
            onEditing: (bool value) {
              setState(() {
                _onEditing = value;
              });
            },
          ),
          // Padding(
          //   padding: EdgeInsets.all(8),
          //   child:Center(
          //     child: _onEditing ? Text(
          //       'Please Enter full Code'
          //       ) : null,
          //   )
          // )
        ],
      ),
    );
  }
  // VERIFIY BUTTON WIDET
  Widget _verifyWidget() {
    return InkWell(
      onTap: () {
        // Navigate to New Password Screen
        if(_onEditing!= true) {
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => NewPassword()));
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
          "Verify",
          style:TextStyle(
            fontSize:20,
            fontFamily: 'CircularStd-Medium',
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
       body:Container(
         height: height,
         child:Stack(
           children:<Widget>[
             Positioned(
               top:30,
               left:10,
               child:_backWidget(),
             ),
             Container(
         padding: EdgeInsets.symmetric(horizontal:20),
                child:Column(
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
                        height: 50,
                      ),
                      _verficationCodeWidget(),
                      SizedBox(
                        height: 50,
                      ),
                      _verifyWidget(),
                 ]
               )
             )
           ],
         ),
       ),
     ),
   );
  }
}