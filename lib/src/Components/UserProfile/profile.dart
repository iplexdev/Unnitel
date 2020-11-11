import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unniTel/src/Components/UserProfile/editProfile.dart';
// import 'package:unniTel/src/Components/UserProfile/userDummyInfo.dart';
import 'package:unniTel/src/Components/mainScreen.dart';
import 'package:unniTel/src/Components/Auth/login.dart';

class Profile extends StatefulWidget {
  final String data;
  final accountData;
  Profile({Key key, this.data, this.accountData}):super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
  
}

class _ProfileState extends State<Profile> {
  SharedPreferences sharedPreferences;
  // Back arraow widget
  Widget _backArrowWidget() {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if(widget.data == 'home' || widget.data == 'myAccount') {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen(res: widget.accountData,)));
              } else {
                Navigator.pop(context); 
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 13),
              child: Row(children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 0, top: 12, bottom: 10),
                  // child: Icon(
                  //   Icons.arrow_back,
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
  
  // DELETE USER WIDGET
  Widget _deleteUserWidget() {
    return GestureDetector(
      onTap: () async {
        sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.remove('token');
        // ignore: deprecated_member_use
        sharedPreferences.commit();
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginScreen()), (route) => false);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 100),
        child: Text(
          'Delete Account',
          style: TextStyle(fontSize: 20, color: HexColor("#7F7F7F"),fontFamily: 'CircularStd-Book'),
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
            title: Text('Particulars',
                      style: TextStyle(fontSize: 20, color: Colors.black,fontFamily: 'CircularStd-Bold')
                      ),
            backgroundColor: Colors.white,
            actions: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditProfile(accountData: widget.accountData)));
                  },
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 0),
                      child: Image.asset('assets/images/edit_icon.png'),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 0),
                      child: Center(
                          child: Text(
                        'Edit',
                        style:
                            TextStyle(fontSize: 18,fontFamily: 'CircularStd-Medium', color: HexColor("#C2D21D")),
                      )),
                    )
                  ])),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Column(
                    children: [
                      
                      new Divider(
                        height: 0,
                        color: HexColor('#E0E1E1'),
                      ),
                      Column(
                        children: [
                          SizedBox(height: 20),
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                           widget.accountData['accountData']['name'],
                            style: TextStyle(
                                fontSize: 26, fontFamily: 'CircularStd-Bold'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            indent: 25,
                            endIndent: 25,
                            color: HexColor('#E0E1E1'),
                          )
                        ],
                      ),
                      // Column()
                      Column(
                        children:[ 
                          Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, bottom: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Name',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'CircularStd-Medium',
                                            color: HexColor("#3F4046")),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.accountData['accountData']['name'],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: HexColor('#9D9D9C'),fontFamily: 'CircularStd-Book')),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                margin:
                                    const EdgeInsets.only(left: 15.0, right: 15),
                                decoration: BoxDecoration(
                                    border: Border(
                                  bottom: BorderSide(
                                      width: 0, color: HexColor('#5D6561')),
                                )),
                              ),
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, bottom: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Country',
                                        style: TextStyle(
                                            fontSize: 18,
                                             fontFamily: 'CircularStd-Medium',
                                            color: HexColor("#3F4046")),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(widget.accountData['accountData']['country'],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: HexColor('#9D9D9C'),fontFamily: 'CircularStd-Book')),
                                        ],
                                      ),
                                      
                                    ],
                                  ),
                                ),
                                margin:
                                    const EdgeInsets.only(left: 15.0, right: 15),
                                decoration: BoxDecoration(
                                    border: Border(
                                  bottom: BorderSide(
                                      width: 0, color: HexColor('#5D6561')),
                                )),
                              ),
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, bottom: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Email',
                                        style: TextStyle(
                                            fontSize: 18,
                                             fontFamily: 'CircularStd-Medium',
                                            color: HexColor("#3F4046")),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(widget.accountData['accountData']['email'],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: HexColor('#9D9D9C'),fontFamily: 'CircularStd-Book')),
                                        ],
                                      ),
                                      
                                    ],
                                  ),
                                ),
                                margin:
                                    const EdgeInsets.only(left: 15.0, right: 15),
                                decoration: BoxDecoration(
                                    border: Border(
                                  bottom: BorderSide(
                                      width: 0, color: HexColor('#5D6561')),
                                )),
                              ),
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, bottom: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Mobile Phone',
                                        style: TextStyle(
                                            fontSize: 18,
                                             fontFamily: 'CircularStd-Medium',
                                             color: HexColor("#3F4046")),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(widget.accountData['accountData']['mobile'],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: HexColor('#9D9D9C'),fontFamily: 'CircularStd-Book')),
                                        ],
                                      ),
                                      
                                    ],
                                  ),
                                ),
                                margin:
                                    const EdgeInsets.only(left: 15.0, right: 15),
                                decoration: BoxDecoration(
                                    border: Border(
                                  bottom: BorderSide(
                                      width: 0, color: HexColor('#5D6561')),
                                )),
                              ),
                              
                        ],
                      ),
                      SizedBox(height:100),
                      _deleteUserWidget()
                    ],
                  ),
                  // Positioned(
                  //   child: _deleteUserWidget(),
                  //   bottom: 20,
                  //   left: 40,
                  // )
                ],
              ),
            ),
          )),
    );
  }
}
