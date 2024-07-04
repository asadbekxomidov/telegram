import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telegram/services/firebase_auth_service.dart';
import 'package:telegram/services/users_firestore_services.dart';
import 'package:telegram/utils/app_routes.dart';

class AuthController with ChangeNotifier {
  final _usersFireStoreServices = UsersFireStoreServices();

  var currentUser;

  Future<void> login(
      String email, String password, BuildContext context) async {
    try {
      await FireBaseAuthService.login(email: email, password: password);
      // Navigator.pushNamed(context, AppRoutes.contacts);
      Navigator.pushReplacementNamed(context, AppRoutes.contacts);
    } catch (e) {
      _showErrorDialog(context, e.toString());
    }
  }

  Future<void> register(String name, String surname, String email,
      String password, BuildContext context) async {
    try {
      UserCredential userCredential =
          await FireBaseAuthService.register(email: email, password: password);
      await _usersFireStoreServices.addUsers(
          userCredential.user!.uid, email, name, surname);
      Navigator.pop(context);
    } catch (e) {
      _showErrorDialog(context, e.toString());
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }
}
