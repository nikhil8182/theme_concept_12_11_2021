import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme.dart';
import 'package:intl/intl.dart';

import 'lobby_screen.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  int _grpValue = 3 ;
  SharedPreferences prefs;
  Timer timer;
  DateTime now ;
  var timeFormat ;
  int time = 0;

  void _getTime() {
    DateTime now = DateTime.now();
    timeFormat = DateFormat('HH').format(now);
    time = int.parse(timeFormat.toString());
    prefs.setInt('time', time);
  }

  initial() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _grpValue = prefs.getInt("val") ?? 3;
      //ignore:avoid_print
      print("_grp value is $_grpValue");
      if(_grpValue == 0){

        setState(() {
          //ignore:avoid_print
          print("the _grpValue 0 $_grpValue");
          _grpValue = 0;
        });

      }else if(_grpValue == 1){

        setState(() {
          //ignore:avoid_print
          print("the _grpValue 1 $_grpValue");
          _grpValue = 1;
        });

      }else if(_grpValue == 2){
        setState(() {
          //ignore:avoid_print
          print("the _grpValue 2 $_grpValue");
          _grpValue = 2;
        });
      }else{
        setState(() {
          //ignore:avoid_print
          print("the _grpValue 3 $_grpValue");
          _grpValue = 3;
        });
      }
    });
    //_grpValue ??= 0;
  }
  @override
  void initState() {
    initial();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.brightness_6),
            color: Colors.white,
            onPressed: () {
              // ignore: avoid_print
              print("button pressed");
              //Provider.of<ThemeProvider>(context, listen: false).swapTheme();
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            //Flexible(child: Image.asset("assets/undraw.co/mobile_login.png")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      RadioListTile(
                          dense: true,
                          activeColor: Colors.orangeAccent,
                          title: const Text(" system "),
                          value: 0,
                          groupValue: _grpValue,
                          onChanged: (newValue){
                            setState(() {
                              //_grpValue = newValue;
                              //ignore:avoid_print
                              print("the radio button 0 $newValue");
                              prefs.setInt('val', newValue);
                              initial();
                              Provider.of<ThemeProvider>(context, listen: false).swapTheme();
                            });
                          }
                      ),
                      RadioListTile(
                          dense: true,
                          activeColor: Colors.orangeAccent,
                          title: const Text(" Dark "),
                          value: 1,
                          groupValue: _grpValue,
                          onChanged: (newValue){
                            setState(() {
                              //_grpValue = newValue;
                              //ignore:avoid_print
                               print("the radio button 0 $newValue");
                               prefs.setInt('val', newValue);
                               initial();
                              Provider.of<ThemeProvider>(context, listen: false).swapTheme();
                            });
                          }
                      ),
                      const SizedBox(height: 10),
                      RadioListTile(
                          dense: true,
                          activeColor: Colors.orangeAccent,
                          title: const Text(" Light "),
                          value: 2,
                          groupValue: _grpValue,
                          onChanged: (newValue){
                            setState(() {
                              //_grpValue = newValue;
                              //ignore:avoid_print
                              print("the radio button 1 $newValue");
                              prefs.setInt('val', newValue);
                              initial();
                              Provider.of<ThemeProvider>(context, listen: false).swapTheme();
                            });
                          }
                      ),
                      const SizedBox(height: 10),
                      RadioListTile(
                          dense: true,
                          activeColor: Colors.orangeAccent,
                          title: const Text(" Auto "),
                          value: 3,
                          groupValue: _grpValue,
                          onChanged: (newValue){
                            setState(() {
                              //_grpValue = newValue;
                              //ignore:avoid_print
                              print("the radio button 0 $newValue");
                              prefs.setInt('val', newValue);
                              initial();
                              Provider.of<ThemeProvider>(context, listen: false).swapTheme();
                            });
                          }
                      ),
                      const SizedBox(height: 200),
                      ElevatedButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: const Text("Next Page")),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
