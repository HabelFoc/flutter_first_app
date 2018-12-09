import 'package:flutter/material.dart';
import 'dart:async';

class NatureDetail extends StatelessWidget {
  final String title;
  final String image;
  final String description;

  NatureDetail(this.title, this.image, this.description);

  // Show Warning Dialog Method
  void _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Are You Sure?',
              style: TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            content: Text('This Action Cannot Be Undone!'),
            actions: <Widget>[
              FlatButton(
                child: Text('CONTINUE'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context,
                      true); // 1st arg = context, 2st arg = your value [bool, String, Map, int] (to delete nature action)
                },
              ),
              FlatButton(
                  child: Text('DISCARD'),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }
  // End Of 'Show Warning Dialog'

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Nature Detail'),
        ),
        body: Container(
          child: Center(
            child: Container(
              width: double.infinity,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Image.network(image),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(title.toUpperCase(),
                        style: TextStyle(fontStyle: FontStyle.italic)),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 10.0, left: 20.0),
                    child: Text(description),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                    width: double.infinity,
                    child: RaisedButton(
                      // Basic Navigation
                      // Poping Page
                      color: Colors.red,
                      onPressed: () => _showWarningDialog(context),
                      // End of Poping Page
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
