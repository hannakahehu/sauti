import 'package:flutter/material.dart';

import 'package:sauti/moreinformation/hyperlink_forms%20of%20sexual%20harassment.dart';
import 'package:sauti/moreinformation/hyperlink_how_to_stop_harassment.dart';

import 'package:sauti/report_perpetrator.dart';
import 'package:url_launcher/url_launcher.dart';


import 'hyperlink.dart';
import 'moreinformation/hyperlink_forms of sexual harassment.dart';
import 'moreinformation/hyperlink_what_sexual_harassment.dart';

class MYDashbord extends StatefulWidget {

  @override
  _MYDashbordState createState() => _MYDashbordState();
}

class _MYDashbordState extends State<MYDashbord> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

      debugShowCheckedModeBanner: false,


      home: Dashboard(),
    );
  }

}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[400],

      body: Container(
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
                        builder: (context) =>  whatisSexualHarrasement()
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
                      Text("what is sexual harassment")
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
                        builder: (context) =>forms()
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

                      Text("forms of Sexual harassment "),
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
                        builder: (context) => stopit()),
                  );
                },
                splashColor: Colors.deepPurple,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image(image: AssetImage("assets/stopIt.png"),
                          height: 120.0),
                      Text("Stop It")
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
                        builder: (context) => ReportSexualharassment()),
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
                      Text("Report"),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
ReportSexualharassment() {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>ReportPerpetrator()),
  );
}
}
class Hyperlink extends StatelessWidget {
  final String _url;
  final String _text;

  Hyperlink(this._url, this._text);

  _launchURL() async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        _text,
        style: TextStyle(decoration: TextDecoration.underline),
      ),
      onTap: _launchURL,
    );
  }
}

class forms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        body:Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("You can  have a dialog, avoid suggestive posture , changing your routine frequently "),
              Hyperlink('https://guimgonzalez.business/', 'More information'),
            ],
          ),
        ),
      ),
    );
  }
}
class whatisSexualHarrasement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("You can  have a dialog, avoid suggestive posture , changing your routine frequently "),
              Hyperlink('https://guimgonzalez.business/', 'more information'),
            ],
          ),
        ),
        
      ),

    );
  }
}
class stopit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepOrange[400],
        body:  Center(


         child: Column(
      mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("You can  have a dialog, avoid suggestive posture , changing your routine frequently ",),
          Hyperlink('https://guimgonzalez.business/', 'more Information '),
        ],
      ),
    ),

      ),
    );
  }
}