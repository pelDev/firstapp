import 'package:flutter/material.dart';
import 'package:commercialapp/models/id.dart';
import 'package:provider/provider.dart';
import 'package:commercialapp/shared/idtile.dart';



class IdView extends StatefulWidget {
  @override
  _IdViewState createState() => _IdViewState();
}

class _IdViewState extends State<IdView> {
  @override
  Widget build(BuildContext context) {

    final ids = Provider.of<List<ID>>(context) ?? [];
    //print(ids.documents);
     
    ids.forEach((id) {
      print(id.name);
      print(id.phonenumber);
      print(id.level);
      print(id.email);
    });

  return 
      ListView.builder(
      itemCount: ids.length,
      itemBuilder: (context, index) {
        return IdTile(id: ids[index],);
      }
      );    
  
    
  }
}





