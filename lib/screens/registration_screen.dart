import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:covidtracker/constant.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          SizedBox(
            height: 48.0,
          ),
          TextField(
            onChanged: (value) {
              //Do something with the user input.
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
                      child: Text('Sign up',
                        style: TextStyle(color: Colors.white, fontSize: verticalPixel*2.5  ,fontStyle: FontStyle.italic, fontFamily: 'Sarpanch'),),
                    ),
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}
