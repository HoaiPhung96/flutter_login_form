import 'package:flutter/material.dart';
import 'package:login_form/screens/home_page.dart';
import 'package:login_form/screens/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      home: LoginPage(
        // title: "Hoai Phụng",
      ),
      // initialRoute: '/login',
      routes: {
        '/login':(context)=> LoginPage(),
        '/home':(context)=> HomePage(),
      },
      
    );
  }
}
