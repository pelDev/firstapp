import 'package:provider/provider.dart';
import 'package:commercialapp/models/user.dart';
import 'package:commercialapp/services/database.dart';
import 'package:flutter/material.dart';
import 'package:commercialapp/services/auth.dart';
import 'package:commercialapp/shared/loading.dart';


class IdDetail extends StatefulWidget {

  @override
  _IdDetailState createState() => _IdDetailState();
}

class _IdDetailState extends State<IdDetail> {

  

  final AuthService _auth = AuthService();


 
  String _currentName;
  String _currentPhone;
  String _currentLevel;
  String _currentEmail;
    final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DataBaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData userData = snapshot.data;
          return Scaffold(

          appBar: AppBar(
            title: Text(
              'Edit ID',
            ),
            centerTitle: true,
            backgroundColor: Colors.deepPurple,
          ),

          body: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 12.0, right: 12.0),
            child: ListView(
              children: <Widget>[

                // first element

                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: TextFormField(
                          validator: (val) => val.isEmpty ? 'Please enter your name' : null,
                          onChanged: (value) {
                            print('Changes in name text field');
                            setState(() => _currentName = value);
                            
                          },
                          initialValue: userData.name,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                            ),
                          ),
                        ),
                      ),

                  Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextFormField(
                    initialValue: userData.phonenumber,
                    validator: (val) => val.length != 11 ? 'Phone number must be 11 digits' : null,
                    onChanged: (value) {
                      print('Changes in phonenumber text field');
                      setState(() => _currentPhone = value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Phonenumber',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                  ),
                ),

                  Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextFormField(
                    initialValue: userData.level,
                    validator: (val) => int.parse(val) > 500 ? 'you have graduated' : null,
                    onChanged: (value) {
                      print('Changes in level text field');
                      setState(() => _currentLevel = value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Level',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextFormField(
                    initialValue: userData.email,
                    validator: (val) => val.isEmpty ? 'Please enter your email' : null,
                    onChanged: (value) {
                      print('Changes in email text field');
                      setState(() => _currentEmail = value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                  ),
                ),
                    
                    ],
                  ),
                ),

                

                

                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Center(
                    child: FlatButton(
                      color: Colors.deepPurple,
                      onPressed: () async {
                        if(_formKey.currentState.validate()) {
                          await DataBaseService(uid: user.uid).updateUserData(
                            _currentName ?? userData.name, 
                            _currentPhone ?? userData.phonenumber, 
                            _currentLevel ?? userData.level, 
                            _currentEmail ?? userData.email
                            );
                            Navigator.pop(context);
                        }
                      }, 
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ), 
                ),

              ],
            ), 
          ),
          
        );
        } else {
          return Loading();
        }
        
      }
    );
  }

  
  // void _showAlertDialog(String title, String message) {

  //   AlertDialog alertDialog = AlertDialog(
  //     title: Text(title),
  //     content: Text(message),
  //   );
  //   showDialog(
  //     context: context,
  //     builder: (_) => alertDialog
  //   );
  // }

}