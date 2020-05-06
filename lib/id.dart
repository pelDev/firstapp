import 'package:commercialapp/models/id.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:commercialapp/services/database.dart';
import 'package:commercialapp/screens/idview.dart';


class OthersId extends StatefulWidget {
  @override
  _OthersIdState createState() => _OthersIdState();
}

class _OthersIdState extends State<OthersId> {
  dynamic level = 100;

  ID id;

  @override
  Widget build(BuildContext context) {

    //final ids = Provider.of<QuerySnapshot>(context);

    //print(ids);

    print('build id ran');
    return StreamProvider<List<ID>>.value(
      value: DataBaseService().ids,
          child: Scaffold(
          backgroundColor: Colors.purple[50],
          appBar: AppBar(
      title: Text('Student ID Card'),
      backgroundColor: Colors.deepPurple,
      centerTitle: true,
      elevation: 0.0,
          ),
          body: IdView(),
        ),
    );

  
  }

    

  
  
}
