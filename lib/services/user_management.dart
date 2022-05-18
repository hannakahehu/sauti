import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import'package:flutter/widgets.dart';
class userManagement{
  Widget handleAuth(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot){

      },
    );
  }

}
//this is for role base authentification
/*authorizeAccess(BuildContext context){
    FirebaseAuth.instance.currentUser().then((user) {
      Firestore.instance
          .collection('/users')
          .where('uid',isEqualTo: user.uid)
          .getDocuments()
          .then((docs){
            if(docs.documents[0].exists) {
              if (docs.documents[0].data['role'] == 'attorney') {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext context) => AttorneyDashBoard()
                    )
                );
              }
            }
            });

      });
    }*/