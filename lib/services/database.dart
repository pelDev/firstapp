import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commercialapp/models/id.dart';
import 'package:commercialapp/models/user.dart';
class DataBaseService {

  final String uid;

  DataBaseService({this.uid});

  // collection refrence
  final CollectionReference idCollection = Firestore.instance.collection('ids');

  Future updateUserData(String name, String phonenumber, String level, String email) async {
    return await idCollection.document(uid).setData({
      'name': name,
      'phonenumber': phonenumber,
      'level': level,
      'email': email,
    }); 
  }

  // get id list from snapshot
  List<ID> _idListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return ID(
        doc.data['name'] ?? '',
        doc.data['phonenumber'] ?? '',
        doc.data['level'] ?? '100',
        doc.data['email'] ?? ''
      );
    }).toList();
  }

  // get id stream
  Stream<List<ID>> get ids {
    return idCollection.snapshots()
    .map(_idListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return idCollection.document(uid).snapshots()
    .map(_userDataFromSnapshot);
  }

  //user data from Snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      phonenumber: snapshot.data['phonenumber'],
      level: snapshot.data['level'],
      email: snapshot.data['email']
    );
  }
  
}