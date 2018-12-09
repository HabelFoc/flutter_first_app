import 'package:flutter/material.dart';

// import 'dart:async';
// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:http/http.dart' as http;

import './main_nature_list.dart';

class NatureManager extends StatelessWidget {
  final List<Map<String, dynamic>> _natures;
  final Function addDataMap;
  final Function deleteDataMap;

  NatureManager(this._natures, this.addDataMap, this.deleteDataMap);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Manage Nature'),
            ),
            ListTile(
              title: Text('Manage Natures'),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/manage',
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Natures'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: NatureList(_natures, deleteDataMap),
          )
        ],
      ),
    );
  }
}
