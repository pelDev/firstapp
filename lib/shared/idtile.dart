import 'package:flutter/material.dart';
import 'package:commercialapp/models/id.dart';


class IdTile extends StatelessWidget {

  final ID id;
  IdTile({this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return IdOfOthers(name: id.name, level: id.level, phone: id.phonenumber, email: id.email);
            }));
          },
              child: Card(
          color: Colors.white,
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            title: Text(
              id.name,
              style: TextStyle(
                color: Colors.purple,
              ), 
            ),
            subtitle: Text(id.level),
          ),
        ),
      ),
    );
  }
}

class IdOfOthers extends StatelessWidget {
  
  final String name;
  final String phone;
  final String level;
  final String email;

  IdOfOthers({this.name, this.phone, this.level, this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              backgroundColor: Colors.purple[50],
              appBar: AppBar(
                title: Text('ID Card'),
                backgroundColor: Colors.deepPurple,
                centerTitle: true,
                elevation: 0.0,
              ),
              body: Padding(
                padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/pelumi.jpg'),
                          radius: 50,
                        ),
                      ),
                      
                      
                      Divider(
                        height: 80,
                        color: Colors.grey,
                      ),
                      Text('NAME',
                          style: TextStyle(
                            color: Colors.grey[200],
                            letterSpacing: 2.0,
                          )),
                      SizedBox(height: 10),
                      Text(name,
                          style: TextStyle(
                            color: Colors.deepPurple,
                            letterSpacing: 2.0,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(height: 30),
                      Text('PHONE NUMBER',
                          style: TextStyle(
                            color: Colors.grey[200],
                            letterSpacing: 2.0,
                          )),
                      SizedBox(height: 10),
                      Text(phone,
                          style: TextStyle(
                            color: Colors.deepPurple,
                            letterSpacing: 2.0,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Level',
                                style: TextStyle(
                                  color: Colors.grey[200],
                                  letterSpacing: 2.0,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                level,
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  letterSpacing: 2.0,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.mail,
                            color: Colors.grey[700],
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              email,
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
  
                    ],
                  ),
                ),
              ),
            );
  }
}