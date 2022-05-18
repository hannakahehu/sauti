import 'package:flutter/material.dart';
import 'package:sauti/chat_app/chat_app.dart';
import 'package:sauti/dash_board.dart';
import 'package:sauti/report_perpetrator.dart';
import 'package:sauti/services/auth.dart';

import 'account_profile.dart';
import 'learning_materil.dart';
import 'settings.dart';
import 'feedback.dart';

class AppDrawer extends StatelessWidget {
AuthMethods authMethods= new AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('sauti'),
        actions: [
          GestureDetector(
            onTap: (){
           authMethods.signOut();
            },
              child: Container(child: Icon(Icons.exit_to_app))
          )],
      ),
      body:
      Center(child: MYDashbord()),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Explore'),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text('Learning Materials'),
              onTap: () {

                // Update the state of the app
                // ...
                // Then close the drawer

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>LearningMaterial ()),
                );

              },
            ),
            ListTile(
              leading: Icon(Icons.sentiment_dissatisfied),
              title: Text('Report Perpetrator'),
              onTap: () {
                // Update the state of the app
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>ReportPerpetrator()),
                );
              },
            ),
            ListTile(
              leading:Icon(Icons.message),
              title: Text('message Attony'),
              onTap: () {
                // Update the state of the app
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>ChatApp ()),
                );
              },
            ),
            ListTile(
              leading:Icon(Icons.account_circle),
              title: Text('Account Profile'),
              onTap: () {
                // Update the state of the app
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>AccountProfile ()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text('Feed back/help?'),
              onTap: () {
                // Update the state of the app
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>FeedbackAndHelp ()),
                );
              },
            ),
            ListTile(
              leading:Icon(Icons.settings),
              title: Text('setting'),
              onTap: () {
                // Update the state of the app
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Settings()),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}