import 'dart:ui';
import 'package:covidtracker/constant.dart';
import 'package:covidtracker/screens/optionLogin_screen.dart';
import 'package:covidtracker/screens/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  final int showID;
  static String id = 'login_screen';

  LoginScreen(this.showID);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var left = Colors.black;
  var right =  Colors.white;
  String phoneNumber;
  String confirmCode;
  String verificationID;
  int shareValue;
  colorCheck(){
    if(shareValue == 0){
      userPages = setColor(Colors.black,Colors.white);
    }
    else{
      userPages = setColor(Colors.white,Colors.black,);
    }

    return userPages;
  }
  Map userPages;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    shareValue = widget.showID;
    userPages = colorCheck();


    _pageController = PageController(initialPage: shareValue);
    SystemChrome.setEnabledSystemUIOverlays([]);
  }
  void _onButtonPress(val) {
    _pageController.animateToPage(val,
        duration: Duration(milliseconds: 550), curve: Curves.decelerate);
    setState(() {

      if(val == 0){

        userPages = setColor(Colors.black, Colors.white);


      }
      else{

        userPages = setColor(Colors.white, Colors.black);


      }


    });
  }


  void onPageChange(val){

  }


  PageController _pageController;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        SizedBox(
          height: verticalPixel*29.3,
        ),


        Container(
          height: verticalPixel*55,
          width: horizontalPixel*80,
          child: Material(
            color: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),

              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: Container(
                  width: horizontalPixel*70,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: <Widget>[
                          CupertinoSlidingSegmentedControl(
                            padding: EdgeInsets.symmetric(horizontal: verticalPixel),
                            onValueChanged: (int val){
                              shareValue = val;
                              _onButtonPress(val);
                            },
                            children: userPages,
                            groupValue: shareValue ,
                          ),
                          buildPageView(),
                          MaterialButton(

                              elevation: 0,
                              //color: Color(0xff7663E9),
                              padding: EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              onPressed: () {

                                Navigator.pushNamed(context, OptionScreen.id);
                              },
                              //D13D23
                              //D63A23
                              child: Ink(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.transparent, Colors.transparent],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,

                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: verticalPixel*1.2, horizontal: verticalPixel*5),
                                  child: FittedBox(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: <Widget>[
                                        Text(
                                            'Log in with other options',
                                            style: TextStyle(color: Colors.white, fontSize: verticalPixel*1.7, fontWeight: FontWeight.w100  )
                                        ),

                                      ],),
                                  ),
                                ),
                              )
                          ),

                          //loginBoxes[shareValue],
                        ],
                      )
                  ),
                ),
              ),
            ),
          ),
        ),

      ],
    );



  }

  buildPageView() {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if(!currentFocus.hasPrimaryFocus){
          currentFocus.unfocus();
        }
      },
      child: Container(
        height: verticalPixel*40,

        child: PageView(
          onPageChanged: (int val){
            shareValue = val;
            _onButtonPress(val);

          },

          controller: _pageController,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[

                    SizedBox(
                      height: 48.0,

                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,

                      onChanged: (value) {
                        //Do something with the user input.
                        this.phoneNumber = value;
                      },
                      decoration: InputDecoration(

                        prefixIcon: Icon(Icons.mail_outline),

                        hintText: 'Enter your email',
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.white10, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.deepOrange[400], width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      onChanged: (value) {
                        //Do something with the user input.
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key),
                        hintText: 'Enter your password',
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.white10, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.deepPurple[200], width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: MaterialButton(
                          elevation: 0,
                          //color: Color(0xff7663E9),
                          padding: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          onPressed: () {

                          },

                          child: Ink(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xffFF3D77), Color(0xffD13D23) ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,

                              ),
                              borderRadius: BorderRadius.all(Radius.circular(32.0)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: verticalPixel, horizontal: verticalPixel*4),
                              child: FittedBox(
                                child: Text('Login',
                                  style: TextStyle(color: Colors.white, fontSize: verticalPixel*2.5  ,fontStyle: FontStyle.italic, fontFamily: 'Righteous'),),
                              ),
                            ),
                          )
                      ),
                    ),
                    SizedBox(height: verticalPixel*2,),

                  ],

                ),
              ),
            ),
            ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: RegistrationScreen())
          ],
        ),
      ),
    );
  } // return PageView
}


setColor(left  , right){
  return  {
    0: Text('Log in', style: TextStyle(color: left),),
    1: Text('Register', style: TextStyle(color: right), )
  };
}

