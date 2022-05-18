import 'package:flutter/material.dart';
import 'package:sauti/helper/helper.dart';
import 'package:sauti/services/auth.dart';
import 'package:sauti/services/database.dart';
import 'package:sauti/sign_inWithGoogle.dart';

import 'app_drawer.dart';
import 'widget.dart';
class SignUp extends StatefulWidget {
final Function toggle;
SignUp(this.toggle);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading=false ;

  AuthMethods authMethods=new AuthMethods();
  DatabaseMethods databaseMethods=new DatabaseMethods();
   final formKey=  GlobalKey<FormState>();
  TextEditingController userNameTextEditingController= new TextEditingController();
  TextEditingController emailTextEditingController= new TextEditingController();
  TextEditingController passwordTextEditingController= new TextEditingController();



 signMeUp(){
   if(formKey.currentState.validate()){
     Map<String ,String> userInfoMap= {
       "name":userNameTextEditingController.text,
       "email":emailTextEditingController.text

     };

      HelperFunction.saveUserEmailSharedPreference(emailTextEditingController.text);
      HelperFunction.saveUserNameSharedPreference(userNameTextEditingController.text);
     setState(() {
      isLoading =true;

     });
     authMethods.signUpWithEmailAndPassword(emailTextEditingController.text,
         passwordTextEditingController.text).then((val) {
      // print("{$val.uid}");


      databaseMethods.uploadUserInfo(userInfoMap);
       Navigator.pushReplacement(context, MaterialPageRoute(
           builder: (context) => AppDrawer()
       ));
     });
   }
 }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: isLoading? Container(
        child: Center(child: CircularProgressIndicator()),
      ):Container(
        color: Colors.deepPurple,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Center(

          child:SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: sautiLogo(),
                ),

                SizedBox(height: 18,),
                Column(

                  children: <Widget>[
                    Column(
                      children: [
                        Form(
                          key: formKey,
                          child: TextFormField(
                            controller:userNameTextEditingController,
                            style: simpleTextStyle(),
                            decoration:textFieldInputDecoration("user name"),
                            validator: (val){
                              return val.isEmpty || val.length < 3 ? "Enter Username 3+ characters" : null;
                            },

                          ),
                        ),

                        TextFormField(

                          controller:emailTextEditingController ,
                          style: simpleTextStyle(),
                          decoration:textFieldInputDecoration("email"),
                          validator: (val){

                            return val.isNotEmpty|| RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                            "please enter a valid email ":null ;
                          },


                        ),
                        TextFormField(
                          obscureText: true,
                          validator: (val){
                          return val.isEmpty||val.length <6? "please provide password at least 6 character": null ;
                          },
                          controller:passwordTextEditingController,
                          style: simpleTextStyle(),
                          decoration: textFieldInputDecoration("password"),

                        ),
                      ],

                    ),
                  ],
                ),
                SizedBox(height:18,),
                Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal:16,vertical: 8),
                      child:Text("Forget Password", style:simpleTextStyle())
                  ),
                ),

                SizedBox(height:15),
                GestureDetector(
                  onTap: (){
                    signMeUp();

                  },
                  child: Container(
                    alignment: Alignment.centerRight,
                    // width:MediaQuery.of(context).size.width ,
                    width:MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical:20.0,horizontal: 10),

                    decoration: BoxDecoration(

                      color: Colors.red[300],
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child:Text("Sign Up           "
                        ,style:TextStyle(
                          color: Colors.white,
                          fontSize:20,

                        )) ,
                  ),
                ),
                SizedBox(height:15),
                _signInButton(),
                SizedBox(height:15),
                Row(

                  children: <Widget>[
                    Text("Already have an account?",style: mediumTextStyle(),),
                    GestureDetector(
                      onTap: (){
                        widget.toggle();

                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("Sign In  now?",style:TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            decoration: TextDecoration.underline
                        ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _signInButton() {
    return OutlineButton(

      onPressed: () {

        signInWithGoogle().whenComplete(() {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return AppDrawer();
              },
            ),
          );
        });

      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),

              child: Text(
                'Sign in with Google',

                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}





class sautiLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage sautiLogo= AssetImage("assets/sautiLogo.png");
    Image logo=Image(image:sautiLogo,);
    return Container(
      height: 200,
      width: 400,
      child: logo,
    );
  }
}


