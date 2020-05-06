

import 'package:commercialapp/models/user.dart';
import 'package:commercialapp/services/auth.dart';
import 'package:commercialapp/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
          child: MaterialApp(
        title: 'Student Organizer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),

        home: Wrapper(),
      ),
    );
  }
}
