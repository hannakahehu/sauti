import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sauti/attony_app/attony_dashbord.dart';
import 'package:sauti/attony_app/attony_sign_up.dart';
import 'package:sauti/sign_Up.dart';

import '../sign_In_page.dart';
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn= true;
  //this function will change the bool statement
  //if it is true it will make it false
  void toggleView(){
    setState(() {
      showSignIn=!showSignIn;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleView);

    }
    else{
      return SignUp(toggleView);

    }
  }
}
