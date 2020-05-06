

import 'package:commercialapp/screens/idform.dart';
import 'mycourses.dart';
import 'schedule.dart';
import 'package:commercialapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:commercialapp/Animatin/FadeAnimation.dart';

class Home extends StatelessWidget {

  

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {

     void _showSettingsPanel() {
    showModalBottomSheet(context: context, builder: (context){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 10.0),
        child: IDFORM(),
      );
    });
  }

    void navigateToCourses() {
      Navigator.push(context, PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 1000),
        transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child){

          animation = CurvedAnimation(
            parent: animation, 
            curve: Curves.elasticInOut
          );

          return ScaleTransition(
            scale: animation,
            child: child,
            alignment: Alignment.center,
          );
        },
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
        return MyCourses();
      }));
    }

    void navigateToSchedule() {
      Navigator.push(context, PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 1000),
        transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child){

          animation = CurvedAnimation(
            parent: animation, 
            curve: Curves.elasticInOut
          );

          return ScaleTransition(
            scale: animation,
            child: child,
            alignment: Alignment.center,
          );
        },
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
        return MyShedule();
      }));
    }
  

    return 

      Scaffold(
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          //title: Text('StudentS'),
          elevation: 0.0,
            
          actions: <Widget> [    
              FlatButton.icon(
                onPressed: () {
                  _showSettingsPanel();
                },
                icon: Icon(
                  Icons.perm_identity,
                  color: Colors.white,
                ),
                label: Text(
                  'ID',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),

              FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                }, 
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ), 
                label: Text('logout', style: TextStyle(color: Colors.white),)
              ),
          ],
          
        ),

        drawer: Drawer(
          child: Container(
            
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 20.0), 
                  child: Text(
                  'Good day',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                
                ),
                
                SizedBox(height: 15.0,),

                FlatButton.icon(
                  onPressed: (){}, 
                  icon: Icon(Icons.person_pin_circle), 
                  label: Text('Logout'),
                ),
              ],
            ),
          ),
        ),

        body: Column(
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(50, 20), bottomRight: Radius.elliptical(50, 20),),
              ),
              child: Center(child: Text(
                'StudentS',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              )),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FadeAnimation(1.0, GestureDetector(
                      onTap: () {
                        print('courses');
                        navigateToCourses();
                      },
                        child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[700],
                              blurRadius: 10.0,
                              //offset: Offset(3, 7)
                            )
                          ]
                        ),
                        child: Center(child: Text(
                          'Courses',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold
                          ),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  FadeAnimation(1.3,  GestureDetector(
                      onTap: () {
                        print('time table');
                      },
                        child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[700],
                              blurRadius: 10.0,
                              //offset: Offset(3, 7)
                            )
                          ]
                        ),
                        child: Center(child: Padding(
                          padding: const EdgeInsets.only(left: 19.0),
                          child: Text(
                            'Reading time table',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FadeAnimation(1.6, GestureDetector(
                      onTap: () {
                        print('Shedule');
                        navigateToSchedule();
                      },
                        child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[700],
                              blurRadius: 10.0,
                              //offset: Offset(3, 7)
                            )
                          ]
                        ),
                        child: Center(child: Text(
                          'Schedule',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold
                          ),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  FadeAnimation(1.9,  GestureDetector(
                      onTap: () {
                        print('Events');
                      },
                        child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[700],
                              blurRadius: 10.0,
                              //offset: Offset(3, 7)
                            )
                          ]
                        ),
                        child: Center(child: Text(
                          'Events',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
           
          ],
        ),
      
    );
  }
  
}





