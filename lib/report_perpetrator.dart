
import 'package:flutter/material.dart';
import 'package:sauti/perpetrator_information.dart';




class ReportPerpetrator extends StatefulWidget {
  @override
  _ReportPerpetratorState createState() => _ReportPerpetratorState();
}

class _ReportPerpetratorState extends State<ReportPerpetrator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),

      home: Scaffold(
        appBar: AppBar(
          title: Text('perpetrators information'),
        ),

      body: MyCustomForm(),
      ),
    );
  }
}