import 'package:flutter/material.dart';

import './nature_create.dart';
import './nature_list.dart';

class ManageNatures extends StatelessWidget {
  final List<Map<String, dynamic>> natures;
  final Function addDataMap;

  ManageNatures(this.natures, this.addDataMap);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        drawer: WillPopScope(
          onWillPop: () {
            print('drawer poped'); // listen for drawer poped
          },
          child: Drawer(
            child: Column(
              children: <Widget>[
                AppBar(
                  automaticallyImplyLeading: false,
                  title: Text('Manage Nature'),
                ),
                ListTile(
                  onTap: () {
                    print(natures);
                    Navigator.pushReplacementNamed(context, '/admin');
                  },
                  title: Text('See All Nature'),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text('Manage Nature'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: 'Create',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'List Nature',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            NatureCreate(natures, addDataMap),
            NatureList(),
          ],
        ),
      ),
    );
  }
}

// on item tapped
// void _onItemTapped(int index) {
//   print(index);
//   switch (index) {
//     case 0:
//       print('index of $index');
//   }
// }

// // Basic Bottom Navigation Bar
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: _onItemTapped,
//         currentIndex: 1, // this will be set when a new tab is tapped
//         items: [
//           BottomNavigationBarItem(
//             icon: new Icon(Icons.home),
//             title: new Text('Home'),
//           ),
//           BottomNavigationBarItem(
//             icon: new Icon(Icons.mail),
//             title: new Text('Messages'),
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.person), title: Text('Profile'))
//         ],
//       ),
//       // End Of Basic Bottom Navigation Bar
