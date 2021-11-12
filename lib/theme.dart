import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  //ThemeData _selectedTheme;
  Timer timer;
  DateTime now ;
  var timeFormat ;
  int time = 0;

  _getTime() async {
    prefs = await SharedPreferences.getInstance();
    DateTime now = DateTime.now();
    timeFormat = DateFormat('HH').format(now);
    time = int.parse(timeFormat.toString());
    prefs.setInt('time', time);
    autoTime();
  }

  ThemeMode _themeMode;
  SharedPreferences prefs;

  // ThemeData dark = ThemeData.dark().copyWith();
  //
  // ThemeData light = ThemeData.light().copyWith();

  ThemeMode dar = ThemeMode.dark;
  ThemeMode lig = ThemeMode.light;
  ThemeMode sys = ThemeMode.system;
  ThemeMode aud ;


  ThemeProvider(int darkValue) {
    //ignore:avoid_print
    //print("%%%%%%%%%%%%%%%%%%%%  $_themeMode ");
    if(_themeMode == null){
      _getTime();
      //autoTime();
    }

    if(darkValue == 3){
      if((time >= 18)||(time <= 7)){
         aud = ThemeMode.dark;
      }else{
         aud = ThemeMode.light;
      }
    }


    //ignore:avoid_print
    print("the theme provider value is $darkValue  @@@@@@@@@@@@@@2");
    _themeMode = (darkValue == 0)? sys : (darkValue == 1) ? lig :(darkValue == 2) ? dar : aud;
    //ignore:avoid_print
    print("%%%%%%%%%%%%%%%%%%%%  $_themeMode ");

  }

  // ThemeProvider(bool darkThemeOn) {
  //   // ignore: avoid_print
  //   print("im inside the theme provider $darkThemeOn");
  //   // ignore: avoid_print
  //   print("in inside the theme provider &&&&&&&&&&&&&&&&&&&&&");
  //   _selectedTheme = darkThemeOn ? dark : light;
  //   // ignore: avoid_print
  //   print("in inside the theme provider of $_selectedTheme  _selectedTheme &&&&&&&&&&&&&&&&&&&&&");
  // }


  // ThemeProvider(int darkThemeOn) {
  //   // ignore: avoid_print
  //   print("im inside the theme provider $darkThemeOn");
  //   // ignore: avoid_print
  //   print("in inside the theme provider &&&&&&&&&&&&&&&&&&&&&");
  //   _selectedTheme = (darkThemeOn == 0) ? dark : (darkThemeOn == 1 ) ? light : dark;
  //   // ignore: avoid_print
  //   print("in inside the theme provider of $_selectedTheme  _selectedTheme &&&&&&&&&&&&&&&&&&&&&");
  // }


  // Future<void> swapTheme() async {
  //   prefs = await SharedPreferences.getInstance();
  //
  //   if (_selectedTheme == dark) {
  //     // ignore: avoid_print
  //     print("im inside the swaptheme of dark $_selectedTheme");
  //     // ignore: avoid_print
  //     print("im inside the swaptheme of dark/*****************");
  //     _selectedTheme = light;
  //     await prefs.setInt("darValue", 1);
  //     //await prefs.setBool("darkTheme", false);
  //
  //   } else {
  //     // ignore: avoid_print
  //     print("im inside the swaptheme of light $_selectedTheme");
  //     // ignore: avoid_print
  //     print("im inside the swaptheme of light 1!!!!!!!!!!!!!!!! ");
  //     _selectedTheme = dark;
  //     await prefs.setInt("darValue", 2);
  //    // await prefs.setBool("darkTheme", true);
  //   }
  //
  //   notifyListeners();
  // }

  autoTime() async {
    if((prefs.getInt('time') >= 18)||(prefs.getInt('time') <= 7))
    {
      //ignore:avoid_print
      print("this . $_themeMode");
      //ignore:avoid_print
      print("this . ${prefs.getInt('time')}");
      //ignore:avoid_print
      print("this is time  ------------- of iffff");
      //_themeMode = dar;
       aud = dar;
      //ignore:avoid_print
      print("this is time  ------------- of iffff of aud is $aud");
      await prefs.setInt("darValue", 3);
    }else{
      //ignore:avoid_print
      print("this . $_themeMode");
      //ignore:avoid_print
      print("this is time  ------------- of else");
      //_themeMode = lig;
      aud = lig;
    //ignore:avoid_print
      print("this is time  ------------- of else aud is $aud");
      await prefs.setInt("darValue", 3);
    }
    return aud;
  }


  Future<void> swapTheme() async {
    prefs = await SharedPreferences.getInstance();

    if(prefs.getInt("val") == 0){
      //ignore:avoid_print
      print("inside the iff off swap theme ${prefs.getInt("val")}");
       _themeMode = sys;
      //ignore:avoid_print
      print("this . $_themeMode");
      await prefs.setInt("darValue", 0);
    } else if(prefs.getInt("val") == 3){
      //ignore:avoid_print
      print("im inisde the ");
      if((prefs.getInt('time') >= 18)||(prefs.getInt('time') <= 7))
      {
        //ignore:avoid_print
        print("this . $_themeMode");
        //ignore:avoid_print
        print("this . ${prefs.getInt('time')}");
        //ignore:avoid_print
        print("this is time  ------------- of iffff");
        _themeMode = dar;
        //aud = dar;
        //ignore:avoid_print
        print("this is time  ------------- of iffff of aud is $aud");
        await prefs.setInt("darValue", 3);
      }else{
        //ignore:avoid_print
        print("this . $_themeMode");
        //ignore:avoid_print
        print("this is time  ------------- of else");
        _themeMode = lig;
        //aud = lig;
        //ignore:avoid_print
        print("this is time  ------------- of else aud is $aud");
        await prefs.setInt("darValue", 3);
      }
    }


    // if (_themeMode == sys) {
    //   // ignore: avoid_print
    //   print("im inside the _themeMode of sys $_themeMode");
    //   // ignore: avoid_print
    //   print("im inside the _themeMode of sys/*****************");
    //   _themeMode = sys;
    //   // ignore: avoid_print
    //   print("im inside the light of sys $_themeMode");
    //   await prefs.setInt("darValue", 0);
    // }
    //ignore:avoid_print

      print("above swaptheme $_themeMode");
     if((_themeMode == dar)&&(prefs.getInt("val") == 2)) {
      // ignore: avoid_print
      print("im inside the light of light $_themeMode");
      // ignore: avoid_print
      print("im inside the _themeMode of light 1!!!!!!!!!!!!!!!! ");
      _themeMode = lig;
      // ignore: avoid_print
      print("im inside the light of light $_themeMode");
      await prefs.setInt("darValue", 1);
    }else if((_themeMode == lig)&&(prefs.getInt("val") == 1)){
      //ignore:avoid_print
      print("im inside the light of light $_themeMode");
      //ignore:avoid_print
      print("im inside the inside the else of swap");
      _themeMode = dar;
      // ignore: avoid_print
      print("im inside the light of dark $_themeMode");
      await prefs.setInt("darValue", 2);
    }else if(_themeMode == sys){
       //ignore:avoid_print
       if(prefs.getInt("val") == 2){
         //ignore:avoid_print
         print("inside of if in swap ##########");
         _themeMode = lig;
         await prefs.setInt("darValue", 1);
       }else if(prefs.getInt("val") == 1)
         {
           //ignore:avoid_print
           print("inside of else if in swap @@@@@@@@@@@@@@@");
           _themeMode = dar;
           await prefs.setInt("darValue", 2);
         }else{
         //ignore:avoid_print
         print("inside of else in swap +++++++++++++++++" );
         _themeMode = sys;
         await prefs.setInt("darValue", 0);
       }


     }

    // else{
    // // ignore: avoid_print
    // print("inside the system mode");
    // _themeMode = sys;
    // // ignore: avoid_print
    // print("im inside the light of dark $_themeMode");
    // await prefs.setInt("darValue", 0);
    // }

    notifyListeners();
  }


  ThemeMode getTheme()=> _themeMode;


  //ThemeData getTheme() => _selectedTheme;
}
