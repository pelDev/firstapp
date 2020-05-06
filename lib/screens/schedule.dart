import 'package:flutter/material.dart';
import 'home.dart';

class MyShedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    void moveToHomeScreen() {
      Navigator.pop(context);
    }

    print('ran shedule');
    return Scaffold(
      backgroundColor: Colors.black,
      

      body: SafeArea(
        child: Column(
          
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'My Schedule',
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  RaisedButton.icon(
                    color: Colors.grey[900],
                onPressed: (){
                  moveToHomeScreen();
                }, 
                icon: Icon(Icons.home, color: Colors.deepPurpleAccent,), 
                label: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),

                ],
              ),
            ),

            
          
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed:() {
          
        },
        child: Icon(Icons.add,), 
      ),
    );
  }

}
