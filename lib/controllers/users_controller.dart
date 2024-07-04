// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:telegram/models/user.dart';
// import 'package:telegram/services/users_firestore_services.dart';

// class UsersController extends ChangeNotifier {
//   final _usersFireStoreServices = UsersFireStoreServices();
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   UsersModel? _currentUser;

//   UsersModel? get currentUser => _currentUser;

//   Stream<QuerySnapshot> get list async* {
//     yield* _usersFireStoreServices.getUsers();
//   }

//   void addUser(String id, String email, String name, String surname) {
//     _usersFireStoreServices.addUser(id, name, email, surname);
//   }

//   Future<void> fetchCurrentUser(String uid) async {
//     final doc = await _firestore.collection('users').doc(uid).get();
//     if (doc.exists) {
//       _currentUser = UsersModel.fromMap(doc);
//       notifyListeners();
//     }
//   }

//   Future<UsersModel> getUserById(String uid) async {
//     final doc = await _firestore.collection('users').doc(uid).get();
//     return UsersModel.fromMap(doc);
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:telegram/models/user.dart';
// import 'package:telegram/services/users_firestore_services.dart';

// class UsersController extends ChangeNotifier {
//   final _usersFireStoreServices = UsersFireStoreServices();
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   UsersModel? _currentUser;

//   UsersModel? get currentUser => _currentUser;

//   Stream<QuerySnapshot> get list async* {
//     yield* _usersFireStoreServices.getUsers();
//   }

//   void addUser(String id, String email, String name, String surname) {
//     _usersFireStoreServices.addUser(id, name, email, surname);
//   }

//   Future<void> fetchCurrentUser(String uid) async {
//     final doc = await _firestore.collection('users').doc(uid).get();
//     if (doc.exists) {
//       _currentUser = UsersModel.fromMap(doc);
//       notifyListeners();
//     }
//   }

//   Future<UsersModel> getUserById(String uid) async {
//     final doc = await _firestore.collection('users').doc(uid).get();
//     return UsersModel.fromMap(doc);
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:telegram/models/user.dart';
import 'package:telegram/services/users_firestore_services.dart';

class UsersController extends ChangeNotifier {
  final _usersFireStoreServices = UsersFireStoreServices();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UsersModel? _currentUser;

  UsersModel? get currentUser => _currentUser;

  Stream<QuerySnapshot> get list async* {
    yield* _usersFireStoreServices.getUsers();
  }

  void addUser(String id, String email, String name, String surname) {
    _usersFireStoreServices.addUser(id, name, email, surname);
  }

  Future<void> fetchCurrentUser(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    if (doc.exists) {
      _currentUser = UsersModel.fromMap(doc);
      notifyListeners();
    }
  }

  Future<UsersModel> getUserById(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    return UsersModel.fromMap(doc);
  }
}