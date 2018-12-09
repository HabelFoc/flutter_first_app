import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NatureList extends StatelessWidget {
  final List<Map<String, dynamic>> natures;
  final Function deleteData;

  NatureList(this.natures, this.deleteData);

  // buildStrings
  Widget _buildNature(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(3.0),
            child: Image.network(natures[index]['image']),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Text(
              natures[index]['title'].toUpperCase(),
              style: TextStyle(
                  fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 10.0),
                    padding: EdgeInsets.only(right: 5.0),
                    child: Text('Rating: ${natures[index]['rating']}',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 20.0,
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    // Basic Navigation
                    // push to another page
                    Navigator.pushNamed<bool>(
                            context, '/product/' + index.toString())
                        .then((value) {
                      if (value) {
                        deleteData(index);
                      }
                    });

                    // End of Basic Navigation
                  },
                  child: Text(
                    'More Details',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    Widget noData =
        Center(child: Text('Currently you don\'t have list of "Nature"'));

    if (natures.length > 0) {
      return ListView.builder(
        itemBuilder: _buildNature,
        itemCount: natures.length,
      );
    }

    return noData;
  }
}
