import 'package:flutter/material.dart';
import 'details/id_detail.dart';
import 'package:provider/provider.dart';
import 'package:commercialapp/models/user.dart';
import 'shared/loading.dart';
import 'package:commercialapp/services/database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';


 File image; 
  String filename;

class MyId extends StatefulWidget {
  @override
  _MyIdState createState() => _MyIdState();
}

class _MyIdState extends State<MyId> {
  
 

  

  @override
  Widget build(BuildContext context) {
    

    void navigateToIdDetail() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return IdDetail();
    }));
  }

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DataBaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Scaffold(
              backgroundColor: Colors.purple[50],
              appBar: AppBar(
                title: Text('My ID Card'),
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
                          backgroundImage: image == null ? AssetImage('assets/pelumi.jpg') : null,
                          radius: 50,
                          child: Container ( 
                            child: image == null ? null : Image.file(image),
                            decoration: BoxDecoration(
                              borderRadius:  BorderRadius.circular(10.0)
                              ), 
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Center(child: FlatButton.icon(
                          label: Text(
                            'change image',
                            style: TextStyle(
                            ),
                          ),
                          onPressed: () {
                            _getImage();
                          },
                          icon: Icon(Icons.edit),
                      )
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
                      Text(userData.name,
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
                      Text(userData.phonenumber,
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
                                userData.level,
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
                              userData.email,
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Center(
                        child: RaisedButton(
                          color: Colors.deepPurple,
                          onPressed: () {
                            navigateToIdDetail();
                          },
                          child: Text(
                            'Edit',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }

  Future _getImage() async {
    var selectedImage = await ImagePicker.pickImage(source: ImageSource.gallery,);

    setState(() {
      image = selectedImage;
      filename = basename(image.path);
    });
  }

  // void imagePicker() {
  //   if(image == null) {
  //     return AssetImage('assets/pelumi.jpg'),
  //   }
  // }

  
}
