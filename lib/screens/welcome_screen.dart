
import 'package:covidtracker/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/constant.dart';
import 'package:covidtracker/responsive/size_config.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_text/gradient_text.dart';

class WelcomeScreen extends StatefulWidget {
  static String id  = 'welcomescreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  AnimationController controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    controller = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this,
      lowerBound: .7,
    );
    controller.forward();
    controller.addListener((){
      setState(() {

      });

    });


  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Container(

        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff130a47), Color(0xffD13D23) ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

          ),
//          //  <<<< background image goes here >>>>
//          image: DecorationImage(
//              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
//              image: AssetImage('images/background.png'),
//              fit: BoxFit.cover
//          ),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: verticalPixel*13,
            ),
            Hero(
              tag: 'logo',
              child: Container(

                child: SvgPicture.asset('assets/logo.svg',
                allowDrawingOutsideViewBox: true,
                semanticsLabel: 'logo',
                fit: BoxFit.contain,),
                height: verticalPixel*12*(controller.value),


              ),
            ),
            SizedBox(
              height: verticalPixel*0,
            ),




            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Welcome to',
                        style: TextStyle(color: Colors.white, fontSize: verticalPixel*3.7),),
                      Text(' Project O',
                        style: TextStyle(color: Color(0xffc31432), fontSize: verticalPixel*3.7  ,fontStyle: FontStyle.italic),),
                    ],
                  ),
                ),

                SizedBox(height: verticalPixel,),
                Text('Help us stop the spread of ',
                    style: TextStyle(color: Colors.white, fontSize: verticalPixel*2)),
                Text('Coronavirus',
                    style: TextStyle(color: Colors.red, fontSize: verticalPixel*2)),
              ],
            ),


            SizedBox(
              height: verticalPixel*30,
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: verticalPixel*5),
              child: MaterialButton(

                  elevation: 0,
                  //color: Color(0xff7663E9),
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  onPressed: () {

                    showCupertinoModalPopup(context: context, builder: (BuildContext context) =>
                        LoginScreen(0));
//                  showCupertinoModalPopup(context: context, builder: (BuildContext context) =>  );
                    //Go to login screen.
                  },
              //D13D23
              //D63A23
                  child: Ink(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xfff00b51), Color(0xffffa62e) ],
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
                                'Countinue with ',
                                style: TextStyle(color: Colors.white, fontSize: verticalPixel*2 ,fontWeight: FontWeight.w100 )
                            ),
                        GradientText(" Omicron",
                            gradient: LinearGradient(
                                colors: [Color(0xffffcda5),  Color(0xffffcf1b), Color(0xffffcda5) ]),
                            style: TextStyle(fontSize: verticalPixel*2.5 ,

                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,



                            ),
                            textAlign: TextAlign.center),
//                            Text(' Omicron',
//                              style: TextStyle(color: Colors.white, fontSize: verticalPixel*2.5  ,fontStyle: FontStyle.italic),),
                          ],),
                      ),
                    ),
                  )
              ),
            ),

            SizedBox(
              height: verticalPixel*5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: GestureDetector(
                onTap: () async {
                  await showCupertinoModalPopup(context: context, builder: (BuildContext context) =>
                      LoginScreen(1)
                  );
                  //Go to registration screen.
                },

                child: Text(
                  "Don't have an account? Sign up here",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: verticalPixel*1.7

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
