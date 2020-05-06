import 'package:commercialapp/Animatin/FadeAnimation.dart';
import 'package:commercialapp/models/user.dart';
import 'package:commercialapp/services/auth.dart';
import 'package:commercialapp/shared/loading.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {

  final Function toggleView;
  Login({this.toggleView});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  
  
  bool showPassword = true;
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  

  User user;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 300,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -35,
                    height: 300,
                    width: width,
                    child: FadeAnimation(
                      1.3,
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/background.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    height: 300,
                    child: FadeAnimation(
                      1.5,
                      Container(
                        width: width + 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/background-2.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                    1.6,
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  FadeAnimation(
                    1.9,
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.purple[100],
                                blurRadius: 20,
                                offset: Offset(0, 10))
                          ]),
                      child: Form(
                        key: _formKey,
                       child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey[400]),
                                ),
                              ),
                              child: TextFormField(
                                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Email',
                                  hintStyle: TextStyle(color: Colors.grey[500]),
                                ),
                              ),
                            ),

                            Container(
                            padding: EdgeInsets.all(5),
                            child: TextFormField(
                              validator: (val) => val.length < 6 ? 'Passwod should have more than 6 characters' : null,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                              obscureText: showPassword,
                              
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  child: Icon(showPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onTap: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                ),
                                border: InputBorder.none,
                                hintText: 'Password',
                                hintStyle: TextStyle(color: Colors.grey[500]),
                              ),
                            ),
                          ),
                            
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1.7,
                      Center(
                          child: Text(
                        'Forgot Password!',
                        style: TextStyle(color: Colors.deepPurple),
                      ))),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                    2,
                    Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 80),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.deepPurple,
                      ),
                      child: FlatButton(
                        onPressed: () async {
                          if(_formKey.currentState.validate()){
                            setState(() {
                              loading = true;
                            });
                     dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                     if(result == null) {
                      setState(() { 
                        error = 'Could not login';
                        loading = false;
                        });
                     }
                   }
                        },
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  FadeAnimation(2, Center(
                      child: GestureDetector(
                        onTap: () {
                          widget.toggleView();
                        },
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10.0),
                  Text(error, style: TextStyle( color: Colors.red))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
