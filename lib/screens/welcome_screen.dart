
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/constant.dart';
import 'package:covidtracker/responsive/size_config.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

class WelcomeScreen extends StatefulWidget {
  static String id  = 'welcomescreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);



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
          image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover
          ),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: verticalPixel*15,
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
                      Text(' Votest',
                        style: TextStyle(color: Color(0xffD63A23), fontSize: verticalPixel*3.7  ,fontStyle: FontStyle.italic),),
                    ],
                  ),
                ),

                SizedBox(height: verticalPixel,),
                Text('A simple platform to \nsafely practice your',
                    style: TextStyle(color: Colors.white, fontSize: verticalPixel*2)),
                Text('rights',
                    style: TextStyle(color: Colors.red, fontSize: verticalPixel*2)),
              ],
            ),


            SizedBox(
              height: verticalPixel*50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: verticalPixel*7),
              child: MaterialButton(
                  elevation: 0,
                  //color: Color(0xff7663E9),
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  onPressed: () {

                    showCupertinoModalPopup(context: context, builder: (BuildContext context) =>
                        null);
//                  showCupertinoModalPopup(context: context, builder: (BuildContext context) =>  );
                    //Go to login screen.
                  },

                  child: Ink(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xffD13D23), Color(0xffD63A23) ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,

                      ),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: verticalPixel*1.2, horizontal: verticalPixel*4),
                      child: FittedBox(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                                'Log in with ',
                                style: TextStyle(color: Colors.black, fontSize: verticalPixel*2  )
                            ),
                            Text(' Votest',
                              style: TextStyle(color: Colors.white, fontSize: verticalPixel*2.5  ,fontStyle: FontStyle.italic),),
                          ],),
                      ),
                    ),
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: GestureDetector(
                onTap: () async {
                  await showCupertinoModalPopup(context: context, builder: (BuildContext context) =>
                      null
                  );
                  //Go to registration screen.
                },

                child: Text(
                  "Don't have an account? Sign up here",
                  style: TextStyle(
                    color: Colors.white70,

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
