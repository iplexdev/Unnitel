import 'dart:io';
import 'package:flutter/material.dart';
import 'package:unniTel/src/Components/mainScreen.dart';
import 'package:flutter/services.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  final accountData;
  const EditProfile({this.accountData});
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String _userName, _country, _phoneNo, _address = '';
  final TextEditingController _userNameCntrl = TextEditingController();
  final TextEditingController _phoneNoCntrl = TextEditingController();
  FocusNode _userNameFocus = FocusNode();
  FocusNode _countryFocus = FocusNode();
  FocusNode _phoneFocus = FocusNode();
  FocusNode _addressFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();
  // BACK WIDGET
   Widget _backArrowWidget() {
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

  // Show Image
  Widget showImage() {
    return Container( 
       decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
        ),
    child:FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.file(
            snapshot.data,
            width: 70,
            height: 70,
            fit: BoxFit.contain,

          );
        } else if (snapshot.error != null) {
          return const Text('Error Picking Image', textAlign: TextAlign.center);
        } else {
          return const Text(
            'No Image',
            textAlign: TextAlign.center,style: TextStyle(height: 5),
          );
        }
      },
    ));
  }

  // Image Pick From Gallery
  Future<File> imageFile;
  pickImageFromGallery(ImageSource source) {
    // ignore: deprecated_member_use
    setState(() {
      // ignore: deprecated_member_use
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  // Profile Image WIDGET
  Widget _profileImageWidget() {
    return Container(

        child: Column(children: <Widget>[
          showImage(),
          
          IconButton(
              icon: Icon(Icons.camera_alt_outlined,),
              onPressed: () {
                pickImageFromGallery(ImageSource.gallery);
              })
        ]
        )
        );
  }

  // Edit Profile Crediential Widget
  Widget _credientialWidget() {
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        // _forgotPasswordField('Email'),
        _userNameField('Name'),
        _countryField('Country'),
        _phoneField('Mobile Phone'),
        // _addressField('Address')
      ]),
    );
  }

  // UserName Input Filed
  Widget _userNameField(String title) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black45,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            // controller: _userNameCntrl..text = widget.accountData['name'],
            initialValue: widget.accountData['accountData']['name'],
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Color(0xfff3f3f4),
              filled: true,
              hintText: 'Name',
            ),
            validator: (value) {
              // Pattern pattern = r'[a-zA-Z][a-zA-Z ]+[a-zA-Z]$';
              RegExp regExp = new RegExp(r'^[a-zA-Z ]+$');
              if (value.isEmpty) {
                return "Please Enter Name";
              } else if (!regExp.hasMatch(value)) {
                return "Invalid user Name";
              } 
              // else if (_userNameCntrl.text.length <= 4) {
              //   return "too short";
              // }
              return null;
            },
            onSaved: (value) => _userName = value,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            autofocus: true,
            focusNode: _userNameFocus,
            onFieldSubmitted: (_) {
              fieldFocusNode(context, _userNameFocus, _phoneFocus);
            },
          ),
        ],
      ),
    );
  }

  // Country Input Field
  Widget _countryField(String title) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black45,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xfff3f3f4),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 70,
                      child: CountryCodePicker(
                        initialSelection: widget.accountData['accountData']['country'],
                        showCountryOnly: true,
                        showOnlyCountryWhenClosed: true,
                        showFlag: false,
                        alignLeft: true,
                        padding: EdgeInsets.only(left: 10),
                        textStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                        child: Icon(Icons.keyboard_arrow_down,
                            color: Colors.black)),
                  ]),
            )
          ],
        ));
  }

  // Phone Number Field
  Widget _phoneField(String title) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black45,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
                      // controller: _phoneNoCntrl..text = widget.accountData['mobile'],
                      initialValue: widget.accountData['accountData']['mobile'],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xfff3f3f4),
                        filled: true,
                        hintText: 'Phone No',
                      ),
                      validator: (value) {
                        // RegExp regExp = new RegExp(r'^[0-9]*$');
                        if (value.isEmpty) {
                          return "Please Enter Number";
                        } 
                        // else if (!regExp.hasMatch(value)) {
                        //   return "Invalid Phone Number";
                        // } 
                        // else if (_phoneNoCntrl.text.length <= 10) {
                        //   return "Invalid";
                        // }
                        return null;
                      },
                      onSaved: (value) => _phoneNo = value,
                      keyboardType: TextInputType.number,
                      // ignore: deprecated_member_use
                      inputFormatters: [
                        // ignore: deprecated_member_use
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                     textInputAction: TextInputAction.done,
                      focusNode: _phoneFocus,
                    ),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Container(
            //         width: 70,
            //         decoration: BoxDecoration(
            //           color: Color(0xfff3f3f4),
            //         ),
            //         child: CountryCodePicker(
            //           initialSelection: 'PK',
            //           showCountryOnly: false,
            //           showOnlyCountryWhenClosed: false,
            //           showFlag: false,
            //           alignLeft: true,
            //           padding: EdgeInsets.only(left: 10),
            //           textStyle: TextStyle(fontSize: 16),
            //         ),
            //       ),
            //       Container(
            //         width: 300,
            //         child: TextFormField(
            //           controller: _phoneNoCntrl,
            //           decoration: InputDecoration(
            //             border: InputBorder.none,
            //             fillColor: Color(0xfff3f3f4),
            //             filled: true,
            //             hintText: 'Phone No',
            //           ),
            //           validator: (value) {
            //             RegExp regExp = new RegExp(r'^[0-9]*$');
            //             if (value.isEmpty) {
            //               return "Please Enter Number";
            //             } else if (!regExp.hasMatch(value)) {
            //               return "Invalid Phone Number";
            //             } else if (_phoneNoCntrl.text.length <= 10) {
            //               return "Invalid";
            //             }
            //             return null;
            //           },
            //           onSaved: (value) => _phoneNo = value,
            //           keyboardType: TextInputType.number,
            //           // ignore: deprecated_member_use
            //           inputFormatters: [
            //             // ignore: deprecated_member_use
            //             WhitelistingTextInputFormatter.digitsOnly
            //           ],
            //           textInputAction: TextInputAction.next,
            //           focusNode: _phoneFocus,
            //           onFieldSubmitted: (_) {
            //             fieldFocusNode(context, _phoneFocus, _addressFocus);
            //           },
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ));
  }

  // _save Edit Form Widget
  Widget _saveEditFormWidget() {
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          // toastMessage("Email Send Successfully");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainScreen(res: widget.accountData,)));
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

// _Address Field
  // Widget _addressField(String title) {
  //   return Container(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Text(
  //           title,
  //           style: TextStyle(
  //             fontSize: 16,
  //             color: Colors.black45,
  //           ),
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         TextFormField(
  //           decoration: InputDecoration(
  //             border: InputBorder.none,
  //             fillColor: Color(0xfff3f3f4),
  //             filled: true,
  //             hintText: 'Enter Address',
  //           ),
  //           validator: (value) {
  //             if (value.isEmpty) {
  //               return "Please Enter Name";
  //             }
  //             return null;
  //           },
  //           onSaved: (value) => _address = value,
  //           keyboardType: TextInputType.text,
  //           focusNode: _addressFocus,
  //           textInputAction: TextInputAction.done,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: height,
            child: Stack(
              children: <Widget>[
                
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: height * .1,
                          ),
                          _profileImageWidget(),
                          SizedBox(height: 20),
                          // _titleWidget(),
                          SizedBox(
                            height: 50,
                          ),
                          _credientialWidget(),
                          SizedBox(
                            height: 20,
                          ),
                          _saveEditFormWidget(),
                        ]),
                  ),
                ),
             Positioned(
                  top: 20,
                  left: 0,
                  child: _backArrowWidget(),
                ),
              ],
            )),
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

// Focus Node for text field
void fieldFocusNode(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
