import 'package:flutter/material.dart';
InputDecoration textFieldInputDecoration(String hintText){
  return InputDecoration(
      hintText:hintText,

      hintStyle:TextStyle(
        color: Colors.white,
      ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color:Colors.white12)),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color:Colors.white),
  ),

  );
}



TextStyle simpleTextStyle(){
  return TextStyle(
    color: Colors.white,
        fontSize: 16,
  );
}
TextStyle mediumTextStyle(){

  return TextStyle(
    color: Colors.white,
    fontSize: 16,
  );
}