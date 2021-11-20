import 'package:demo_theme/screens/login_screen.dart';
import 'package:demo_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';





//theme on auto theme concept
//19-nov-2021 completed ..

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {

    var isDarkTheme = prefs.getInt("darValue") ?? 3 ;
    var isDarkTime = prefs.getInt('time') ?? 0 ;
    //ignore:avoid_print
    print("the value of theme provider $isDarkTheme");
    //ignore:avoid_print
    print("the time in theme provider is $isDarkTime");
    // return runApp(
    //   ChangeNotifierProvider<ThemeProvider>(
    //     child:  MyApp(),
    //     create: (BuildContext context) {
    //       return ThemeProvider(isDarkTheme);
    //     },
    //   ),
    runApp(MyApp(isDarkTheme,isDarkTime)
    );
  });
}

class MyApp extends StatelessWidget {
  final int darkNum;
  final int darkTim;
  MyApp(this.darkNum,this.darkTim);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return Consumer<ThemeProvider>(
    //   builder: (context, value, child) {
    //     return MaterialApp(
    //       title: 'Flutter Demo',
    //       //themeMode: ThemeMode.light,
    //       theme: value.getTheme(),
    //       home: LoginScreen(),
    //     );
    //   },
    // );
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(darkNum,darkTim),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
            return MaterialApp(
               themeMode: themeProvider.getTheme(),
               //theme: themeProvider.getTheme(),
               theme: ThemeData.light(),
               darkTheme: ThemeData.dark(),
               home: DemoLogin(),
              debugShowCheckedModeBanner: false,
          );
        }
    );
  }
}


class DemoLogin extends StatefulWidget {

  @override
  _DemoLoginState createState() => _DemoLoginState();
}

class _DemoLoginState extends State<DemoLogin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: ElevatedButton(child: Text("Next"),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
          },

          ),),

      ),
    );
  }
}
