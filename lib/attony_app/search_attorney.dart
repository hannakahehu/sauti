import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import'package:sauti/chat_app/chat_app.dart';
import 'package:sauti/services/database.dart';
import 'package:sauti/widget.dart';
class SearchAttorney extends StatefulWidget {
  @override
  _SearchAttorneyState createState() => _SearchAttorneyState();
}

class _SearchAttorneyState extends State<SearchAttorney> {

TextEditingController searchTextEditingController= new TextEditingController();
DatabaseMethods databaseMethods= new DatabaseMethods();

QuerySnapshot searchSnapShot;

attorneyInitiateSearch(){
  databaseMethods.getUserByUsername(searchTextEditingController.text).then((val){
  setState(() {
    searchSnapShot =val;
  });

  });
}
Widget attorneySearchList(){
  return searchSnapShot !=null ?  ListView.builder(itemCount:searchSnapShot.documents.length ,
  shrinkWrap: true,
  itemBuilder: (context,index) {
    return AttorneySearchTile(
      userName: searchSnapShot.documents[index].data["name"],
      userEmail: searchSnapShot.documents[index].data["email"],
    );


  }):Container();
}
@override
void initState(){

  super.initState();
}
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('sauti',),


      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Container(
             padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
             child: Row(
               children: [
                 Expanded(
                   child: TextField(
                     controller: searchTextEditingController,
                     style: TextStyle(color:Colors.white),
                     decoration: InputDecoration(
                       hintText: " search username",
                           hintStyle:TextStyle(color: Colors.deepPurple),
                           border: InputBorder.none
                     ),
                   ),
                 ),
                 GestureDetector(
                   onTap: (){

                   },
                   child: Container(
                     height: 40,
                     width: 40,
                     decoration: BoxDecoration(
                     color: Colors.indigo,
                           borderRadius:BorderRadius.circular(40),
                     ),
                     padding: EdgeInsets.all(12),
                     child: Icon(Icons.search),

                   ),
                 )
               ],
             ),
           ),
            attorneySearchList()
          ],
        ),
      ),
    );
  }
}

class AttorneySearchTile extends StatelessWidget {
  final String userName ;
  final String userEmail;
 AttorneySearchTile({this.userName,this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text("userName",style:mediumTextStyle() ,),
              Text("userEmail", style: mediumTextStyle(),)
            ],

          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color:Colors.blue,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16,vertical:8),
            child: Text("message",style: mediumTextStyle(),),
          )
        ],
      ),
    );
  }
}
