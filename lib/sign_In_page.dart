import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauti/services/auth.dart';
import 'package:sauti/sign_inWithGoogle.dart';


import 'app_drawer.dart';
import 'widget.dart';

class SignIn extends StatefulWidget {
 final Function toggle;
 SignIn(this.toggle);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
    bool isLoading = false;

    AuthMethods authMethods=new AuthMethods();

    final formKey=  GlobalKey<FormState>();
    TextEditingController userNameTextEditingController= new TextEditingController();
    TextEditingController emailTextEditingController= new TextEditingController();
    TextEditingController passwordTextEditingController= new TextEditingController();



    signMeUp(){
      if(formKey.currentState.validate()){
        setState(() {
          isLoading =true;
        });
        authMethods.signUpWithEmailAndPassword(emailTextEditingController.text,
            passwordTextEditingController.text).then((val) {
          //print("{$val.uid}");
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => AppDrawer()
          ));
        });
      }
    }



  @override
  Widget build(BuildContext context){
    return Scaffold(

      body:isLoading? Container(child: Center( child: CircularProgressIndicator()),
      )
         :Container(
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
                          child: Column(children:[
                            TextFormField(
                            validator: (val){
                              return val.isEmpty||val.length<4  ?"user name must be more than four characters":null;
                            },
                            controller:userNameTextEditingController,
                            style: simpleTextStyle(),
                            decoration:textFieldInputDecoration("user name"),
                          ),

                        TextFormField(
                          obscureText: true,
                          validator: (val){
                            return val.length >6?"please Enter a valid password"  :null ;
                          },
                          controller:passwordTextEditingController,
                          style: simpleTextStyle(),
                          decoration: textFieldInputDecoration("password"),

                        ),
                        ])


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
                Container(
                  alignment: Alignment.centerRight,
                  // width:MediaQuery.of(context).size.width ,
                  width:MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical:20.0,horizontal: 10),

                  decoration: BoxDecoration(

                    color: Colors.red[300],
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child:Text("Sign In            "
                      ,style:TextStyle(
                    color: Colors.white,
                    fontSize:20,

                  )) ,
                ),
                SizedBox(height:15),
                _signInButton(),
                SizedBox(height:15),
                Row(

                  children: <Widget>[
                    Text("Don't have an account?",style: mediumTextStyle(),),
                    GestureDetector(
                      onTap: (){
                        widget.toggle();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("Register now?",style:TextStyle(
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
          ]),
              ),
        ),
      )
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