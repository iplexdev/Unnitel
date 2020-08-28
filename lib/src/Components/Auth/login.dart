import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  final _formKey = GlobalKey<FormState>();
  String _email, _password ='';
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
              color: Colors.black45
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
              hintText: 'example@example.com'
            ),
            validator: (email) => EmailValidator.validate(email) ? null 
            : 'Invalid Email',
            onSaved: (email) => _email = email,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            autofocus: true,
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
              color: Colors.black45
            ),
          ),
          SizedBox(height:10),
          TextFormField(
            decoration: InputDecoration(
              border:InputBorder.none,
              fillColor:Color(0xfff3f3f4),
              filled: true,
              hintText: '********',
            ),
            textInputAction: TextInputAction.done,
            obscureText: true,
            keyboardType: TextInputType.text,
            focusNode: _passwordFocusNode,
            onSaved: (pass) => _password = pass,
            validator: (pass) {
              Pattern pattern = r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
              RegExp regExp = new RegExp(pattern);
               if(pass.isEmpty){
                return 'Please enter Field';
              }
              else if(!regExp.hasMatch(pass)){
                return 'Invalid Password';
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
      final data = Data(
        email: _email,
        password: _password
      );
      return InkWell(
        onTap: () {
          if(_formKey.currentState.validate()) {
            _formKey.currentState.save();
            toastMessage("Successfully Login");
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => MainScreen()
          ),
          );
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
              color: Colors.white
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
            fontSize: 14,
            fontWeight:FontWeight.w500,
            color:Colors.black
          ),
        ),
      ),
    );
  }
  // Divider Widget
  Widget _divider() {
    return Container(
      child: Row(
        children: <Widget>[
          SizedBox(
            width:20
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:10),
              child: Divider(thickness: 1,)
            ),
          ),
          Text('or'),
          Expanded(
            child:Padding(
              padding: EdgeInsets.symmetric(horizontal:10),
              child: Divider(
                thickness: 1,
              )
            )
          ),
          SizedBox(
            width:20
          ),
        ]
      ),
    );
  }
// Facebook Login Widget
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
              fontSize: 13,
              fontWeight:FontWeight.w600
            ),
            ),
            SizedBox(
              width: 5
            ),
            Text(
              'Sing Up',
              style:TextStyle(
                color: Color(0xfff79c4f),
                fontWeight: FontWeight.w600,
                fontSize: 13
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
        child: Stack(
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
                    _loginWidget(),
                    _forgotPasswordWidget(),
                    _divider(),
                    _socialLoginWidget(),
                    _registeredWidget(),
                  ]
                )
              ),
            ),
            // Positioned(
            //   top: 75,
            //   left: 8,
            //   child: _logo()
            //   ),
          ]
        ),
      ),
    );
  }
}
// Function for Focusing Field
void fieldFocusNode(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  print('message$currentFocus');
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