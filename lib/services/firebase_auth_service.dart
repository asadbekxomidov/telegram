import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static Future<UserCredential> register({
    required String email,
    required String password,
  }) async {
    try {
      return await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'An unknown error occurred';
    } catch (e) {
      throw 'An unknown error occurred';
    }
  }

  static Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'An unknown error occurred';
    } catch (e) {
      throw 'An unknown error occurred';
    }
  }

  Future<void> addUser(String uid, String email, String name, String surname) async {
    await _firestore.collection('users').doc(uid).set({
      'email': email,
      'name': name,
      'surname': surname,
    });
  }

  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}