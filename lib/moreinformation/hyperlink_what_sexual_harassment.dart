import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HyperlinkformsWhatIsSexualHarassment extends StatelessWidget {
  String _url;
  String _text;

  HyperlinkformsWhatIsSexualHarassment (this._url, this._text);

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


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Scaffold(
        body: Center(
          child: HyperlinkformsWhatIsSexualHarassment('https://guimgonzalez.business/', 'Awesome website!'),
        ),
      ),
    );
  }
}