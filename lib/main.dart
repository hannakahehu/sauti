import 'package:flutter/material.dart';
import 'package:sauti/modal/user.dart';
import 'package:sauti/sign_Up.dart';


import 'helper/authenticate.dart';
import 'home_page.dart';
import 'sign_In_page.dart';

void main() =>runApp(home_page());
class home_page extends StatefulWidget {



   
  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {


  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:' sauti',
      theme: ThemeData(
        primarySwatch: Colors.purple,


      ),
      home: Authenticate()
    );
  }
}