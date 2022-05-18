import 'package:flutter/material.dart';
import 'package:sauti/app_drawer.dart';
import 'package:sauti/chat_app/searchmyattorney.dart';
import 'package:sauti/helper/authenticate.dart';
import 'package:sauti/services/auth.dart';
import 'package:sauti/sign_In_page.dart';

class ChatApp extends StatefulWidget {
  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  AuthMethods authMethods= new AuthMethods();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat with my attony"),


      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: (){
           Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchUser()));    },

      ),
    );
  }
}