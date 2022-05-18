import 'package:flutter/material.dart';
import 'package:sauti/attony_app/finished_cases.dart';
import 'package:sauti/attony_app/pending_cases.dart';
import 'package:sauti/attony_app/queries.dart';

import 'allocatedVictims.dart';
class AttorneyDashBoard extends StatefulWidget {
  @override
  _AttorneyDashBoardState createState() => _AttorneyDashBoardState();
}

class _AttorneyDashBoardState extends State<AttorneyDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
      child: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(3.0),
        children: <Widget>[
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  allocatedVictims()
                  ),
                );
              },
              splashColor: Colors.deepPurple,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image(image: AssetImage("assets/sexual harasement.png"),
                        height: 120.0),
                    Text("Allocated Victims")
                  ],
                ),
              ),
            ),
          ),
          Card(

            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>pendingCases()
                  ),
                );
              },
              splashColor: Colors.deepPurple,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image(image: AssetImage(
                        "assets/forms of sexual harassment.png"),
                        height: 120.0),

                    Text("Pending Cases "),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>finishedCases ()),
                );
              },
              splashColor: Colors.deepPurple,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image(image: AssetImage("assets/stopIt.png"),
                        height: 120.0),
                    Text("Finished cases")
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => queries()),
                );
              },
              splashColor: Colors.deepPurple,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image(image: AssetImage(
                        "assets/report sexual harasement.png"),
                        height: 120.0),
                    Text("Queries"),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),

    );
  }
}
