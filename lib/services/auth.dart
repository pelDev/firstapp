import 'package:commercialapp/models/user.dart';
import 'package:commercialapp/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on fire base object

  User userFromFireBaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user) => _userFromFireBaseUser(user));
    .map(userFromFireBaseUser);
  }

  // sign in anonymosly
  Future signInAnom() async {
    try {
     AuthResult result = await _auth.signInAnonymously();
     FirebaseUser user = result.user;
     return userFromFireBaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign with email password
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return userFromFireBaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // register with email and pasword
  Future registerWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      // create a new document for the user with the uid
      await DataBaseService(uid: user.uid).updateUserData('', '', '100', '');
      
      return userFromFireBaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

}