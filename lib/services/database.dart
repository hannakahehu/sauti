import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  //used by user to access attorny
  getUserByUsername(String username) async {
     return await  Firestore.instance.collection("attorneyInfo")
        .where("name",isEqualTo:username )
        .getDocuments();

  }
//used by user to access user
  getAttorneyInfoByUsername(String username){
    Firestore.instance.collection("users")
        .where("name",isEqualTo:username )
        .getDocuments();

  }
  
  uploadUserInfo(userMap){
    Firestore.instance.collection("users")
        .add(userMap).catchError((e){
      print(e.toString());
    });
  }
  createChatRoom(String chatroomId,chatRoomMap){
    Firestore.instance.collection(" ChatRoom")
        .document(chatroomId).setData(chatRoomMap).catchError((e){
      print(e.toString());
    });
  }
getPerpetratorByNameOfPerpetrator(String  perpetrator){

}
  uploadPerpetratorInfo(perpetratorMap){
    Firestore.instance.collection("perpetratorInfo")
        .add(perpetratorMap).catchError((e){
      print(e.toString());
    });
  }
  getAttorneyInfo(String attorney){

  }
  uploadAttorneyInfo(attorneyMap) {
    Firestore.instance.collection("attorneyInfo")
        .add(attorneyMap).catchError((e) {
          print(e.toString());

    });
  }
}