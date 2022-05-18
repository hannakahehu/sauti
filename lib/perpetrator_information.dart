import 'package:flutter/material.dart';
import 'package:sauti/services/database.dart';
import 'dash_board.dart';

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  @override

  final formKey = GlobalKey<FormState>();
  DatabaseMethods databaseMethods= new DatabaseMethods();
  TextEditingController nameOfPerpetratorTextEditingController= new TextEditingController();
  TextEditingController designationOfPerpetratorTextEditingController= new TextEditingController();
  TextEditingController telephoneNumberOfPerpetratorTextEditingController= new TextEditingController();
  TextEditingController nicknameTextEditingController= new TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
             child:Center(child: Column(
                children: [
                  SingleChildScrollView(
                    child: Form(
                      key: formKey,
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                        TextFormField(
                          controller:nameOfPerpetratorTextEditingController ,

                          decoration: InputDecoration(
                           hintText: "Name of the perpetrator",
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                         color: Colors.amber,
                         style: BorderStyle.solid,
                           ),
                           ),
                          ),
                          validator: (value) {
                          if (value.isEmpty) {
                             return 'Please enter some text';
                               }
                         return null;
                              },
                          ),

                        TextFormField(
                          decoration: InputDecoration(
                        hintText: "Designation of the perpetrator",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.amber,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      } else {
                        return null;
                      }
                    },
                    controller: designationOfPerpetratorTextEditingController,
                  ),
                          TextFormField(
                    decoration: InputDecoration(
                      hintText: "Telephone Number of perpetrator",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.amber,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      } else {
                        return null;
                      }
                    },
                    controller: telephoneNumberOfPerpetratorTextEditingController,
                  ),
                         TextFormField(
                        decoration: InputDecoration(
                        hintText: "Nick name",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.amber,
                          style: BorderStyle.solid,
                         ),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      } else {
                        return null;
                      }
                    },
                    controller: nicknameTextEditingController,
                  ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: RaisedButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, or false
                                // otherwise.
                                if (formKey.currentState.validate()) {
                                  // If the form is valid, display a Snackbar.
                                  Map<String ,String> perpetratorInfoMap= {
                                    "perpetrator" :nameOfPerpetratorTextEditingController.text,
                                    "designation of perpetrator" :nameOfPerpetratorTextEditingController.text,
                                    "telephone number of perpetrator":telephoneNumberOfPerpetratorTextEditingController.text,
                                    "nickname" :nicknameTextEditingController.text,
                                  };


                                  Scaffold.of(context)
                                      .showSnackBar(SnackBar(content: Text('Processing Data')));

                                  databaseMethods.uploadPerpetratorInfo(perpetratorInfoMap);
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => Dashboard()
                                  ));

                                }
                              },
                              child: Text('Submit'),
                            ),
                          ),
                        ],


              )
                    ),

      )
     ,   ]
    ))
    ),
        ));
  }

}
