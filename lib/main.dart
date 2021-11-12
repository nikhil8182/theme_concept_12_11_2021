import 'package:demo_theme/screens/login_screen.dart';
import 'package:demo_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    //var isDarkTheme = prefs.getBool("darkTheme") ?? false;
    var isDarkTheme = prefs.getInt("darValue") ?? 0 ;
    //ignore:avoid_print
    print("the value of theme provider $isDarkTheme");
    // return runApp(
    //   ChangeNotifierProvider<ThemeProvider>(
    //     child:  MyApp(),
    //     create: (BuildContext context) {
    //       return ThemeProvider(isDarkTheme);
    //     },
    //   ),
    runApp(MyApp(isDarkTheme)
    );
  });
}

class MyApp extends StatelessWidget {
  final int darkNum;
  MyApp(this.darkNum);


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
        create: (context) => ThemeProvider(darkNum),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
            return MaterialApp(
              //themeMode: (widget.val == null) ? ThemeMode.system : (widget.val == 0) ? ThemeMode.system : (widget.val == 1) ? ThemeMode.light : ThemeMode.dark,
              //themeMode: themeee as ThemeMode ,
              //themeMode: themeProvider.themeMode,
              //themeMode: themeProvider.getTheme(),
              // (themeProvider.theme() == ThemeMode.dark)? ThemeMode.dark:
              // (themeProvider.theme() == ThemeMode.light) ? ThemeMode.light :
              // (themeProvider.theme() == ThemeMode.system) ? ThemeMode.system: null,
              //theme: (val == null) ? MyThemes.darkTheme : (val  == 0) ? MyThemes.darkTheme : (val == 1) ? MyThemes.lightTheme : MyThemes.darkTheme,
              //darkTheme: MyThemes.darkTheme,
               themeMode: themeProvider.getTheme(),
               //theme: themeProvider.getTheme(),
               theme: ThemeData.light(),
               darkTheme: ThemeData.dark(),
               home: LoginScreen(),
              debugShowCheckedModeBanner: false,
          );
        }
    );
  }
}
