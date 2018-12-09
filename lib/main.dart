import 'package:flutter/material.dart';

import './pages/auth.dart';
import './nature_manager.dart';
import './pages/manage_natures.dart';
import './pages/nature_details.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> natures = [];

  @override
  void initState() {
    super.initState();
  }

  /* CUSTOM FUNCTIONS */
  // Add Nature
  void addDataMap(Map<String, dynamic> mapObj) {
    setState(() {
      natures.add(mapObj);
    });
  }

  // Delete Nature
  void deleteDataMap(int mapIndex) {
    setState(() {
      natures.removeAt(mapIndex);
    });
  }
  /* END OF CUSTOM FUNCTIONS */

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Montserrat',
          brightness: Brightness.light,
          primarySwatch: Colors.amber,
          accentColor: Colors.amberAccent),
      home: Auth(),
      // specify named route
      routes: {
        '/admin': (BuildContext context) {
          return NatureManager(natures, addDataMap, deleteDataMap);
        },
        '/manage': (BuildContext context) => ManageNatures(natures, addDataMap),
      },
      // target specific named route
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElement = settings.name.split('/');
        if (pathElement[0] != '') {
          return null;
        }
        if (pathElement[1] == 'product') {
          final int index =
              int.parse(pathElement[2]); //  access index element to delete
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => NatureDetail(
                natures[index]['title'],
                natures[index]['image'],
                natures[index]['description']),
          );
        }
      },
      //  handle unknown route
      // redirect to home page (list of nature)
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return NatureManager(natures, addDataMap, deleteDataMap);
          },
        );
      },
    );
  }
}
