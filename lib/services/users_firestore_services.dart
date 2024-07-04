// import 'package:cloud_firestore/cloud_firestore.dart';

// class UsersFireStoreServices {
//   final _usersCollections = FirebaseFirestore.instance.collection('users');
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Stream<QuerySnapshot> getUsers() async* {
//     yield* _usersCollections.snapshots();
//   }

//   void addUser(String id, String name, String email, String surname) {
//     _usersCollections.doc(id).set({
//       "name": name,
//       "email": email,
//       "surname": surname,
//     });
//   }

//   Future<void> addUsers(String uid, String email, String name, String surname) async {
//     await _firestore.collection('users').doc(uid).set({
//       'email': email,
//       'name': name,
//       'surname': surname,
//     });
//   }
// }



// import 'package:cloud_firestore/cloud_firestore.dart';

// class UsersFireStoreServices {
//   final _usersCollections = FirebaseFirestore.instance.collection('users');
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Stream<QuerySnapshot> getUsers() async* {
//     yield* _usersCollections.snapshots();
//   }

//   void addUser(String id, String name, String email, String surname) {
//     _usersCollections.doc(id).set({
//       "name": name,
//       "email": email,
//       "surname": surname,
//     });
//   }

//   Future<void> addUsers(String uid, String email, String name, String surname) async {
//     await _firestore.collection('users').doc(uid).set({
//       'email': email,
//       'name': name,
//       'surname': surname,
//     });
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';

class UsersFireStoreServices {
  final _usersCollections = FirebaseFirestore.instance.collection('users');
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getUsers() async* {
    yield* _usersCollections.snapshots();
  }

  void addUser(String id, String name, String email, String surname) {
    _usersCollections.doc(id).set({
      "name": name,
      "email": email,
      "surname": surname,
    });
  }

  Future<void> addUsers(String uid, String email, String name, String surname) async {
    await _firestore.collection('users').doc(uid).set({
      'email': email,
      'name': name,
      'surname': surname,
    });
  }
}