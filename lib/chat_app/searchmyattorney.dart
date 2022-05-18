import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauti/services/database.dart';
import 'package:sauti/widget.dart';
class SearchUser extends StatefulWidget {
  @override
  _SearchUserState createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUser> {
  DatabaseMethods databaseMethods= new DatabaseMethods();
   TextEditingController searchTextEditingController =new TextEditingController();
  QuerySnapshot searchSnapShot;

  initiateSearch() {

    databaseMethods.getUserByUsername(searchTextEditingController
        .text).then((val){
     setState(() {
       searchSnapShot=val;
     });

    });
  }

  createChatRoomAndStartConversation(String userName){
    List<String> users =[userName,];
    List<String> attorneyInfor=[userName,];

  //  databaseMethods.createChatRoom(chatroomId, chatRoomMap)

  }

   Widget userSearchList(){
    return searchSnapShot !=null? ListView.builder(
      itemCount: searchSnapShot.documents.length ,
        shrinkWrap: true,
        itemBuilder: (context,index ){
        return  UserSearchTile(
          userName:searchSnapShot.documents[index].data["name"],
          userEmail: searchSnapShot.documents[index].data["email"],
        );
        }):Container();
  }
@override
  void initState() {

    super.initState();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sauti"),),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Colors.purple,
              padding: EdgeInsets.symmetric(horizontal: 24,vertical:16 ,),

              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: searchTextEditingController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "search Username",
                          hintStyle:  TextStyle(
                            color: Colors.grey,

                          ),
                          border: InputBorder.none
                        ),

                      )),
                  GestureDetector(
                    onTap: (){
                      initiateSearch();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),

                        padding:EdgeInsets.all(13) ,

                        child: Image.asset("assets/search.png")),
                  ),
                ],
              ),
            ),
            userSearchList()
          ],
        ),
      ),
    );
  }
}
class UserSearchTile extends StatelessWidget {
  final String userName;
  final String userEmail;
  UserSearchTile( {this.userName,this.userEmail });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      color: Colors.deepPurpleAccent,
      child:Row(
        children: [
        Column(

          crossAxisAlignment:CrossAxisAlignment.start,

          children: [
            Text(userName,style:simpleTextStyle() ,),
            Text(userEmail,style: simpleTextStyle(),)
          ],

        ), 
          Spacer(),
          GestureDetector(
            onTap: (){

            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
              child: Text(" Message "),
            ),
          ),
        ],
      ) ,
    );
  }
}
