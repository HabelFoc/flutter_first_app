import 'package:flutter/material.dart';
import 'dart:math';

class NatureCreate extends StatefulWidget {
  final List<Map<String, dynamic>> natures;
  final Function addDataMap;

  NatureCreate(this.natures, this.addDataMap);

  @override
  State<StatefulWidget> createState() {
    return _NatureCreateState();
  }
}

class _NatureCreateState extends State<NatureCreate> {
  String natureTitle = '';
  String natureDesc = 'The Nature';
  int natureStarRate = 0;

  bool obsescureInput = true;

  // Showing Toast Method
  void _showToast(BuildContext context, text) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Montserrat'),
      ),
    ));
  }

  // Handle Text Controller
  TextEditingController _natureTitleControll = new TextEditingController();
  TextEditingController _natureDescControll = new TextEditingController();
  TextEditingController _natureRateControll = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: Column(children: <Widget>[
          TextField(
            // Nature title
            controller: _natureTitleControll,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(labelText: 'Title'),
            keyboardType: TextInputType.text,
            onChanged: (String value) {
              setState(() {
                natureTitle = value;
              });
            },
          ),
          TextField(
              // Nature description
              controller: _natureDescControll,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: 'Nature Description'),
              keyboardType: TextInputType.text,
              onChanged: (String value) {
                setState(() {
                  natureDesc = value;
                });
              }),
          TextField(
              //  Nature rating
              controller: _natureRateControll,
              obscureText: obsescureInput,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nature Rating'),
              onChanged: (String value) {
                RegExp exp = new RegExp(r"^[0-9]+$");
                var isNumber = exp.hasMatch(value);
                if (isNumber) {
                  setState(() {
                    natureStarRate = int.parse(value);
                  });
                } else {
                  if (value != '') {
                    // show dialog if input not empty
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Type Warning',
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontStyle: FontStyle.italic),
                            ),
                            content: Text('Input Must Type Number'),
                          );
                        });
                  }
                }
              }),
          SwitchListTile(
              activeColor: Colors.green,
              value: obsescureInput,
              onChanged: (bool value) {
                setState(() {
                  obsescureInput = value;
                });
              },
              title: Text(obsescureInput ? 'Show' : 'Hide',
                  style: TextStyle(color: Colors.black))),
          Container(
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  // input validation
                  if (natureTitle != '' && natureDesc != '') {
                    // height randomness
                    final List<int> numRange = [310, 330, 350, 320];
                    final Random random = new Random();

                    // create nature (map type)
                    final Map<String, dynamic> nature = {
                      'title': natureTitle,
                      'image':
                          'https://source.unsplash.com/400x${numRange[random.nextInt(numRange.length)]}?${natureDesc.split(',').length > 0 ? '${natureDesc.split(',')[0]},${natureDesc.split(',')[1]}' : 'water,mountain'}',
                      'description': natureDesc,
                      'rating': natureStarRate,
                    };

                    // add nature to list
                    widget.addDataMap(nature);

                    // showing a toast
                    _showToast(context, 'Added To The List');

                    // Clear Input Field (to fill in again)
                    setState(() {
                      _natureTitleControll.clear();
                      _natureDescControll.clear();
                      _natureRateControll.clear();
                    });

                    // Redirect To Home Page
                    Navigator.pushNamed(context, '/admin');
                  } else {
                    _showToast(context, 'Please fill in the empty field');
                  }
                },
                color: Colors.green,
                textColor: Colors.white,
                child: Text('Save'),
              )),
        ]));
  }
}
