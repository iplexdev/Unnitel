import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:unniTel/Api/api.dart';
import 'package:unniTel/src/Components/Auth/PasswordVerification/forgotPassword.dart';
import 'package:unniTel/src/Components/Auth/signup.dart';
import 'package:unniTel/src/Components/mainScreen.dart';

class Data {
  final String email;
  final String password;
  Data({this.email, this.password});
}
class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}):super(key: key);
  final String title;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  String _email, _password ='';
  bool _isLoading = false;
  // BackButton Start Widget
   Widget _logo() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
              child:Image(
                image: AssetImage('assets/images/img_logo_unnitel.png'),
                height: 50,
                ) ,
        );
  }
  // BackButton End Widget
  // Title Widget Start
  Widget _title() {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
         text: 'Welcome to UNNItel',
            style: TextStyle(
              fontSize:20,
              fontFamily: 'CircularStd-Medium',
              color:Colors.black
              ),
      )
    );
  }
  // Title Widget End
  // Email and Password Widget Start
  Widget _credientialWidget() {
    return Form(
      key:_formKey,
      child:Column(
        children: <Widget>[
          _emailFieldWidget("Email"),
          _passwordFiledWidget('Password'), 
        ],
      )
    );
  }
  // Email Filed Widget
  Widget _emailFieldWidget(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'CircularStd-Book',
              color: Hexcolor('#9D9D9C')
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border:InputBorder.none,
              fillColor:Color(0xfff3f3f4),
              filled: true,
              hintText: 'example@example.com',
              hintStyle: TextStyle(fontSize:16)
            ),
            style: TextStyle(fontSize:18, fontFamily: 'CircularStd-Medium', color:Colors.black),
            validator: (email) => EmailValidator.validate(email) ? null 
            : 'Invalid Email',
            onSaved: (email) => _email = email,
            controller: emailController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            // autofocus: true,
            focusNode: _emailFocusNode,
            onFieldSubmitted: (_){
              fieldFocusNode(context, _emailFocusNode, _passwordFocusNode);
            },
          ),
        ],
      ),
    );
  }
  // Password Filed Widget 
  Widget _passwordFiledWidget(String title) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            title,
            style:TextStyle(
              fontSize: 16,
              color: Hexcolor('#9D9D9C'),
              fontFamily: 'CircularStd-Book'
            ),
          ),
          SizedBox(height:10),
          TextFormField(
            decoration: InputDecoration(
              border:InputBorder.none,
              fillColor:Color(0xfff3f3f4),
              filled: true,
              hintText: '********',
              hintStyle: TextStyle(fontSize:16)
            ),
            style: TextStyle(fontSize:18, fontFamily:'CircularStd-Medium', color:Colors.black),
            textInputAction: TextInputAction.done,
            obscureText: true,
            keyboardType: TextInputType.text,
            focusNode: _passwordFocusNode,
            controller: passwordController,
            onSaved: (pass) => _password = pass,
            validator: (pass) {
               if(pass.isEmpty){
                return 'Please enter Field';
              }
              else if(passwordController.text.length< 6){
                return 'Invalid Password.Must have minimum of 6 character';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
  // Login Widget Start
    Widget _loginWidget() {
      return InkWell(
        onTap: () async {
          
          if(_formKey.currentState.validate()) {
            _formKey.currentState.save();
            setState(() {
            _isLoading = true;
          });
          var email = emailController.text;
          var password = passwordController.text;
          var res = await loginUser(email, password);
          // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          if(res.containsKey('status')) {
            toastMessage(res['status']);
            if(res['status'] == 'Login Successful') {
               Navigator.of(context).pushAndRemoveUntil(
                           MaterialPageRoute(builder: (BuildContext context) => MainScreen(res: res)), (Route<dynamic> route) => false);
              // setState(() {
              //   _isLoading = false;
              // sharedPreferences.setString('token', res['token']);
              //  Navigator.of(context).pushAndRemoveUntil(
              //              MaterialPageRoute(builder: (BuildContext context) => MainScreen(res: res)), (Route<dynamic> route) => false);
              // });
            }
          } else {
            toastMessage("Login Failed");
          }
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.lime[600],
          ),
          child: Text(
            'Sign In',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'CircularStd-Medium'
            ),
          ),
        ),
      );
    }
  // Login Widget End
  // Forgort Password Widget Start
  Widget _forgotPasswordWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => ForgotPassword())
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical:20),
        alignment: Alignment.center,
        child: Text(
          'Forgot your Password ?',
          style: TextStyle(
            fontSize: 16,
            // fontWeight:FontWeight.w500,
            fontFamily: 'CircularStd-Medium',
            color:Colors.black
          ),
        ),
      ),
    );
  }
  
// Facebook and Google Logo Widget
// not use now 
// ignore: unused_element
Widget _socialLoginWidget() {
  return Container(
    height: 50,
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
// Registered Widget
Widget _registeredWidget() {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUp())
        );
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical:20),
      padding: EdgeInsets.all(12),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Text(
            'Don\'t have an account ?',
            style: TextStyle(
              fontSize: 16,
              color: Hexcolor('#9D9D9C'),
              fontFamily: 'CircularStd-Book',
            ),
            ),
            SizedBox(
              width: 5
            ),
            Text(
              'Sign Up',
              style:TextStyle(
                color: Hexcolor('#C2D21D'),
                fontFamily: 'CircularStd-Bold',
                fontWeight: FontWeight.w600,
                fontSize: 18
              )
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
        child: _isLoading ? Center(child: CircularProgressIndicator(),):
         Stack(
          children:<Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: height * .12,
                    ),
                    _logo(),
                  SizedBox(
                    height: 20,
                  ),
                    _title(),
                    SizedBox(
                      height: 15
                    ),
                    _credientialWidget(),
                    SizedBox(
                      height: 20
                    ),
                    _forgotPasswordWidget(),
                    _loginWidget(),
                    Container(
                    transform: Matrix4.translationValues(0.0, -15.0, 0.0),
                    child:_registeredWidget(),
                    )
                  ]
                )
              ),
            ),
          ]
        ),
      ),
    );
  }
}
// Function for Focusing Field
void fieldFocusNode(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
// Function For Toast
void toastMessage(String message) {
  Fluttertoast.showToast(
    msg:message,
    toastLength: Toast.LENGTH_SHORT,
    textColor: Colors.black,
    backgroundColor: Colors.green,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    fontSize: 16,
  );
}