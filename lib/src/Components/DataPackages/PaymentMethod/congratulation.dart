import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:unniTel/src/Components/mainScreen.dart';

class Congratulation extends StatefulWidget {
  final actualData;
  const Congratulation({this.actualData});
  @override
  _CongratulationState createState() => _CongratulationState();
}

class _CongratulationState extends State<Congratulation> {
  Widget _bubbleWidget() {
     return Container(
      width: MediaQuery.of(context).size.width,
      child: Image.asset('assets/images/bubble_icon.png'),
    );
  }
  Widget _titleWidget(){
    return Container(
    
      child: Padding(
        padding: const EdgeInsets.only(bottom:200),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
              margin: EdgeInsets.symmetric(horizontal:50),
              padding: EdgeInsets.symmetric(vertical:20),
                  decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: HexColor('#C85972'),
                              width: 1,
                            )),
                child:Column(

                  children:[
              Image.asset('assets/images/package_icon.png'),
              SizedBox(height:6),
              Text('GLOBAL',style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'CircularStd-Bold',decoration: TextDecoration.none,),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/wifi_icon.png'),
                  SizedBox(width:10),
                  Text('Huawei WIFI Family', style: TextStyle(
                    fontSize: 12,
                    color: HexColor('#C59FA7'),
                    fontFamily: 'CircularStd-Book',
                    decoration: TextDecoration.none
                  ),),
                   
                ],
              ),
                  ]
                  )
              ),
              SizedBox(height:20),
              Text('Congratulations', style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'CircularStd-Bold',
                    fontSize: 24,
                    color: HexColor('#ffffff'),
                    decoration: TextDecoration.none
                  ),)
            ],
          ),
        ),
      ),
    );
  }
  Widget _bgWidget() {
    return Container(
      height: 500,
      width: MediaQuery.of(context).size.width,
     child: Image.asset('assets/images/congrulation_bg.png',
              height: 500,
              fit: BoxFit.fill,
            ),
    );
  }

  Widget _savePassWidget() {
    return GestureDetector(
      onTap: () {
        toastMessage('Congratulations');
        Navigator.push(
               context, MaterialPageRoute(builder: (context) => MainScreen(res: widget.actualData)));
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
          'Done',
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 20,
              color: Colors.white,
             fontFamily: 'CircularStd-Medium'),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            _bgWidget(),
            _bubbleWidget(),
            _titleWidget(),
            // _paymentMethodWidget(),
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: _savePassWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
//  TOAST METHOD
void toastMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength:Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      fontSize: 16,
      backgroundColor:Colors.greenAccent,
      textColor: Colors.black);
}
