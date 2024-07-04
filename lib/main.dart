import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telegram/controllers/auth_controller.dart';
import 'package:telegram/controllers/users_controller.dart';
import 'package:telegram/firebase_options.dart';
import 'package:telegram/utils/app_routes.dart';
import 'package:telegram/views/screens/chats_screens.dart';
import 'package:telegram/views/screens/contacts_screens.dart';
import 'package:telegram/views/screens/login_screen.dart';
import 'package:telegram/views/screens/register_screen.dart';
import 'package:telegram/views/screens/settings_screens.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(  
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthController()),
        ChangeNotifierProvider(create: (context) => UsersController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ContactsScreen();
          }
          return LoginScreen();
        },
      ),
      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.register: (context) => const RegisterScreen(),
        AppRoutes.contacts: (context) => const ContactsScreen(),
        AppRoutes.settings: (context) => SettingsScreen(),
        AppRoutes.chat: (context) => const ChatsScreens(),
      },
    );
  }
}
