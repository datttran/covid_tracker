import 'package:covidtracker/screens/optionLogin_screen.dart';
import 'package:flutter/material.dart';

import 'screens/welcome_screen.dart';


//APP NAME: Votest //
void main() => runApp(Votest());

class Votest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        accentColor: Colors.white,
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes:{
        WelcomeScreen.id : (context) => WelcomeScreen(),
        //LoginScreen.id : (context) => LoginScreen(0),
        //RegistrationScreen.id : (context) => LoginScreen(1),
        //ChatScreen.id : (context) => ChatScreen(),
        OptionScreen.id : (context) => OptionScreen(),

      },
    );
  }
}
