import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:unniTel/src/Components/Auth/login.dart';
import 'package:unniTel/src/Components/homeScreen.dart';
// Data Member
class Data {
  final String email;
  final String password;
  final String confirmedpassword;
  Data({
    this.email,
    this.password,
    this.confirmedpassword
  });
}
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String  _email, _password,_confirmedPassword ='';
  final TextEditingController _emailCntrl = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _confirmedPasswordFocusNode = FocusNode();

  // Back_Button Widget
  // Widget _backButtonWidget() {
  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.pop(context);
  //     },
  //     child: Container(
  //       padding: EdgeInsets.symmetric(horizontal: 10),
  //       child: Row(
  //         children: <Widget>[
  //           Container(
  //             padding: EdgeInsets.only(left:0,top:10,bottom:10),
  //             child: Icon(
  //               Icons.keyboard_arrow_left,
  //               color: Colors.black,
  //             ),
  //           ),
  //           Text(
  //             'Back',
  //             style: TextStyle(fontSize: 12,fontWeight:FontWeight.w500)
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
  // Logo Widget
  Widget _logo() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
              child:Image(
                image: AssetImage('assets/images/img_logo_unnitel.png'),
                height: 50,
                ) ,
        );
  }
  // Title Widget
  Widget _titleWidget() {
     return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
         text: 'Create your account',
            style: TextStyle(
              fontSize:20,
              fontFamily: 'CircularStd-Medium',
              color:Colors.black
              ),
      )
    );
  }
  // Credientials Widget
  Widget _credientialWidget() {
    return Form(
      key: _formKey,
      child:Column(
      children:<Widget>[
        _emailField('Email'),
        _passworfField('Password', isPassword: true),
        _confirmedPasswordField('Confirm Password', isPassword: true),
      ]
    ),
    );
  }
  
  // Email Filed Widget
  Widget _emailField(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'CircularStd-Book',
              color: Colors.black45
            ),
          ),
          SizedBox(
            height:10,
          ),
          TextFormField(
            controller: _emailCntrl,
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Color(0xfff3f3f4),
              filled: true,
              hintText: 'example@example.com',
              hintStyle: TextStyle(fontSize: 16)
            ),
            style: TextStyle(fontSize:18, fontFamily:'CircularStd-Medium', color:Colors.black),
            validator: (email) => EmailValidator.validate(email)?null
            : "Invalid Email",
            onSaved: (email) => _email = email,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            // autofocus: true,
            focusNode: _emailFocusNode,
            onFieldSubmitted: (_) {
              fieldFocusNode(context, _emailFocusNode, _passwordFocusNode);
            },
          ),
        ],
      ),
    );
  }
  //  Password Filed Widget
  Widget _passworfField(String title, {bool isPassword=true}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
         Text(
            title,
            style:TextStyle(
              fontSize: 16,
              fontFamily: 'CircularStd-Book',
              color: Colors.black45
            ),
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: _pass,
            decoration: InputDecoration(
              border:InputBorder.none,
              fillColor: Color(0xfff3f3f4),
              filled: true,
              hintText: '********',
              hintStyle: TextStyle(fontSize: 16)
            ),
            style: TextStyle(fontSize:18,fontFamily: 'CircularStd-Medium',color: Colors.black),
            validator:(value){
              // Pattern pattern = r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
              // RegExp regExp = new RegExp(pattern);
              if(value.isEmpty){
                return 'Please enter Password';
              } else if(_pass.text.length< 6){
                return 'Invalid Password.Must have minimum of 6 character';
              }
              return null;
            },
            obscureText: isPassword,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            onSaved: (value) => _password = value,
            focusNode: _passwordFocusNode,
            onFieldSubmitted: (_) {
              fieldFocusNode(context, _passwordFocusNode, _confirmedPasswordFocusNode);
            },
          ),
        ]
      ),
    );
  }
  // Confirm Password
  Widget _confirmedPasswordField(String title, {bool isPassword=true}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            title,
            style:TextStyle(
              fontSize: 16,
              fontFamily: 'CircularStd-Book',
              color: Colors.black45
            ),
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: _confirmPass,
            decoration: InputDecoration(
              border:InputBorder.none,
              fillColor: Color(0xfff3f3f4),
              filled: true,
              hintText: '********',
              hintStyle: TextStyle(fontSize:16)
            ),
            style: TextStyle(fontSize:18,fontFamily:'CircularStd-Medium', color:Colors.black),
            validator:(value){
              if(value.isEmpty){
                return 'Please enter Password';
              } 
              else if (value != _pass.text) {
                return "Not Match";
              }
              return null;
            },
            obscureText: isPassword,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            onSaved: (value) => _confirmedPassword = value,
            focusNode: _confirmedPasswordFocusNode,
          ),
        ]
      ),
    );
  }
  // Registered Widget
  Widget _registeredWidget(){
    final data = Data(
      email: _email,
      password: _password,
      confirmedpassword: _confirmedPassword
    );
    return InkWell(
      onTap: () {
        if(_formKey.currentState.validate()) {
          _formKey.currentState.save();
          toastMessage('Register Successfully');
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomeScreen(data: data))
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
            'Sign Up',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'CircularStd-Medium',
              color: Colors.white
            ),
          ),
      ),
    );
  }

// Facebook and Google Auth Widget
// Not used
// ignore: unused_element
Widget _socialLoginWidget() {
  return Container(
    height: 50,
     width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.symmetric(vertical:12),
    padding: EdgeInsets.symmetric(horizontal:10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget>[
          Container(
            width: 150,
           decoration: BoxDecoration(
             color:Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            border: Border.all(width:0.5, color:Colors.black45)
           ),
           alignment: Alignment.center,
            child:Text('f',
            style:TextStyle(
              color:Colors.blue,
              fontSize:40,
              fontWeight:FontWeight.bold
            )
            )
          ),
          Flexible(
            child: Container(
              width: 150,
              margin: EdgeInsets.only(left: 10),
             decoration: BoxDecoration(
               color:Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border: Border.all(width:0.5, color:Colors.black45)
             ),
             alignment: Alignment.center,
              child: Image(
                image: AssetImage(
                  'assets/images/google_icon.png',
                ),
                height: 36,
                ),
            ),
          )
      ]
    ),
  );
}
  // Login Label Widget
  Widget _loginLabelWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => LoginScreen())
        );
      },
      child: Container(
        // margin: EdgeInsets.symmetric(vertical: 12),
        padding: EdgeInsets.all(8),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Already have an account ?',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'CircularStd-Book',
            ),
            ),
            SizedBox(
              width:5,
            ),
            Text(
              'Sign In',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'CircularStd-Bold',
                color: Hexcolor('#C2D21D'),
              ),
            )
          ]
        )
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children:<Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child:SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  SizedBox(
                    height: height * .1,
                  ),
                  _logo(),
                  SizedBox(
                    height: 20,
                  ),
                  _titleWidget(),
                  SizedBox(
                      height: 20,
                    ),
                  _credientialWidget(),
                  SizedBox(
                   height: 20,
                  ),
                  _registeredWidget(),
                  SizedBox(height: 10,),
                  //   _socialLoginWidget(),
                  _loginLabelWidget(),
                ]
              ),
              ),
            ),
            // Positioned(
            //   top: 30,
            //   left: 0,
            //   child: _backButtonWidget(),
            // )
          ]
        ),
      ),
    );
  }
}
 // Change the Field Focus
  void fieldFocusNode(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
  // Toast Helping Function
  void toastMessage (String message){
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb:1,
      fontSize: 16,
      backgroundColor: Colors.green,
      textColor: Colors.black
    );
  }