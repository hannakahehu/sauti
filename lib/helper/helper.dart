import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';


class HelperFunction {

    static String sharedPreferenceUserLoggedInKey="ISUSERLOGGEDIN";
    static String  sharedPreferenceUserNameKey="USERNAMEKEY";
    static String  sharedPreferenceUserEmailKey="USEREMAILKEY";
    //SAVING DATA TO SHARED preference
static Future<bool>saveUserLoggedInSharedPreference (bool isUserLoggedIn)
  async{
  SharedPreferences prefs= await SharedPreferences.getInstance();
  return await prefs.setBool(sharedPreferenceUserLoggedInKey, isUserLoggedIn);
  }
  static Future<bool>saveUserNameSharedPreference (String userName)
    async{
      SharedPreferences prefs= await SharedPreferences.getInstance();
      return await prefs.setString(sharedPreferenceUserNameKey, userName);
    }
    static Future<bool>saveUserEmailSharedPreference (String userEmail)
    async{
      SharedPreferences prefs= await SharedPreferences.getInstance();
      return await prefs.setString(sharedPreferenceUserEmailKey, userEmail);
    }

    //getting data from sharedPreference

    static Future<bool>getUserLoggedInSharedPreference ()
    async{
      SharedPreferences prefs= await SharedPreferences.getInstance();
      return await prefs.getBool(sharedPreferenceUserLoggedInKey);
    }
    static Future<String>getUserNameSharedPreference ()
    async{
      SharedPreferences prefs= await SharedPreferences.getInstance();
      return await prefs.getString(sharedPreferenceUserNameKey);
    }
    static Future<String>getUserEmailSharedPreference ()
    async{
      SharedPreferences prefs= await SharedPreferences.getInstance();
      return await prefs.getString(sharedPreferenceUserEmailKey);
    }


}