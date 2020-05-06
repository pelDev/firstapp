import 'package:commercialapp/authentication/athentication.dart';
import 'package:commercialapp/models/user.dart';
import 'package:commercialapp/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    

    // return home or authentication widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }

  }
}