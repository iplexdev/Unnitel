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
          InkWell(
            onTap: () {
              if(widget.data == 'home' || widget.data == 'myAccount') {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen(res: widget.accountData,)));
              } else {
                Navigator.pop(context); 
              }
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
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('Profile_Account_Data${widget.accountData}');
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            leading: _backArrowWidget(),
            title: Padding(
              padding: const EdgeInsets.only(left: 0, top: 10),
              child: Center(
                  child: Text('Profile',
                      style: TextStyle(fontSize: 18, color: Colors.black))),
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
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Image.asset('assets/images/edit_icon.png'),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 10),
                      child: Center(
                          child: Text(
                        'Edit',
                        style:
                            TextStyle(fontSize: 18, color: Hexcolor("#C2D21D")),
                      )),
                    )
                  ])),
            ],
          ),
          body: Container(
            child: Stack(
              children: [
                Column(
                  children: [
                    new Divider(
                      color: Hexcolor('#5D6561'),
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
                          'User Name',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Divider(
                        //   indent: 25,
                        //   endIndent: 25,
                        //   color: Hexcolor('#5D6561'),
                        // )
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
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(widget.accountData['accountData']['name'],
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Hexcolor('#9D9D9C'))),
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
                                    width: 0, color: Hexcolor('#5D6561')),
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
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(widget.accountData['accountData']['country'],
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Hexcolor('#9D9D9C'))),
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
                                    width: 0, color: Hexcolor('#5D6561')),
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
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(widget.accountData['accountData']['email'],
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Hexcolor('#9D9D9C'))),
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
                                    width: 0, color: Hexcolor('#5D6561')),
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
                                      'Mobile',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(widget.accountData['accountData']['mobile'],
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Hexcolor('#9D9D9C'))),
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
                                    width: 0, color: Hexcolor('#5D6561')),
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
          )),
    );
  }
}
