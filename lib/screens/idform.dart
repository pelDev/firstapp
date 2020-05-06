import 'package:flutter/material.dart';
import 'package:commercialapp/id.dart';
import 'package:commercialapp/myid.dart';


class IDFORM extends StatefulWidget {
  @override
  _IDFORMState createState() => _IDFORMState();
}

class _IDFORMState extends State<IDFORM> {

  // final _formKey = GlobalKey<FormState>();
  // final List<String> idType = ['Me', 'Others'];

  @override
  Widget build(BuildContext context) {
        final width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(

        
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
          'View',
            style: TextStyle(
              color: Colors.brown[800],
              fontSize: 30.0
            ),
          ),
          SizedBox(height: 30.0,),
          Container(
              
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 20.0
                  )
                ]
              ),
              width: width ,
              height: 40.0, 
              child: FlatButton(
                onPressed: () {
                  navigateToMyId();
                },
                child: Text(
                'Me',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontFamily: 'IndieFlower',
                  fontWeight: FontWeight.bold
                ),
                ),
              ),
            ),

          SizedBox(height: 30.0,),

          Container(
              
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 20.0
                  )
                ]
              ),
              width: width ,
              height: 40.0, 
              child: FlatButton(
                onPressed: (){
                  navigateToOthersId();
                },
                child: Text(
                'Others',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontFamily: 'IndieFlower',
                  fontWeight: FontWeight.bold
                ),
                ),
              ),
            ),


        ],
      ),
    );
  }

  void navigateToOthersId() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return OthersId();
    }));
  }

  void navigateToMyId() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return MyId();
    }));
  }
}