// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:telegram/utils/app_routes.dart';

// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({Key? key}) : super(key: key);

//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('More'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           children: [
//             ListTile(
//               leading: Icon(Icons.person),
//               title: Text('My Profile'),
//               onTap: () {},
//               trailing: Icon(Icons.chevron_right),
//             ),
//             ListTile(
//               onTap: () {
//                 FirebaseAuth.instance.signOut();
//                 Navigator.pushReplacementNamed(context, AppRoutes.login);
//               },
//               leading: Icon(Icons.person_2_outlined),
//               title: Text('Logout'),
//               trailing: Icon(Icons.chevron_right),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         height: 80,
//         width: double.infinity,
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                 splashColor: Colors.transparent,
//                 highlightColor: Colors.transparent,
//                 onPressed: () {
//                   Navigator.pushReplacementNamed(context, AppRoutes.contacts);
//                 },
//                 icon: Icon(CupertinoIcons.person_3_fill, color: Colors.black),
//               ),
//               IconButton(
//                 splashColor: Colors.transparent,
//                 highlightColor: Colors.transparent,
//                 onPressed: () {
//                   Navigator.pushReplacementNamed(context, AppRoutes.chat);
//                 },
//                 icon:
//                     Icon(CupertinoIcons.chat_bubble_text, color: Colors.black),
//               ),
//               IconButton(
//                 splashColor: Colors.transparent,
//                 highlightColor: Colors.transparent,
//                 onPressed: () {},
//                 icon: Icon(Icons.more_horiz, color: Colors.black),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:telegram/utils/app_routes.dart';
// import 'package:telegram/models/user.dart';
// import 'package:telegram/views/screens/messages_screen.dart';

// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({Key? key}) : super(key: key);

//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   UsersModel currentUser = UsersModel(
//     id: '',
//     name: '',
//     email: '',
//     surname: '',
//     message: '',
//     avatarUrl: '',
//     userId: '',
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('More'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           children: [
//             ListTile(
//               leading: Icon(Icons.person),
//               title: Text('My Profile'),
//               onTap: () {
//                 // Navigator.pushReplacementNamed(context, AppRoutes.myAccount);
//               },
//               trailing: Icon(Icons.chevron_right),
//             ),
//             ListTile(
//               onTap: () {
//                 FirebaseAuth.instance.signOut();
//                 Navigator.pushReplacementNamed(context, AppRoutes.login);
//               },
//               leading: Icon(Icons.person_2_outlined),
//               title: Text('Logout'),
//               trailing: Icon(Icons.chevron_right),
//             ),
//             ListTile(
//               onTap: () {
//                 String recipientUserId =
//                     'user123'; // Replace with recipient's user ID
//                 String message = 'Hello!';

//                 currentUser.sendMessageToUser(recipientUserId, message);

//                 // Navigator.push(context, MaterialPageRoute(builder: (context) => MessagesScreen(recipientUserId: recipientUserId)));
//               },
//               leading: Icon(Icons.send),
//               title: Text('Send Message'),
//               trailing: Icon(Icons.chevron_right),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         height: 80,
//         width: double.infinity,
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                 splashColor: Colors.transparent,
//                 highlightColor: Colors.transparent,
//                 onPressed: () {
//                   Navigator.pushReplacementNamed(context, AppRoutes.contacts);
//                 },
//                 icon: Icon(CupertinoIcons.person_3_fill, color: Colors.black),
//               ),
//               IconButton(
//                 splashColor: Colors.transparent,
//                 highlightColor: Colors.transparent,
//                 onPressed: () {
//                   Navigator.pushReplacementNamed(context, AppRoutes.chat);
//                 },
//                 icon:
//                     Icon(CupertinoIcons.chat_bubble_text, color: Colors.black),
//               ),
//               IconButton(
//                 splashColor: Colors.transparent,
//                 highlightColor: Colors.transparent,
//                 onPressed: () {},
//                 icon: Icon(Icons.more_horiz, color: Colors.black),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telegram/controllers/users_controller.dart';
import 'package:telegram/models/user.dart';
import 'package:telegram/utils/app_routes.dart';
import 'package:telegram/views/screens/messages_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final usersController = context.watch<UsersController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('More'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text('Almayra Zamzamy'),
            subtitle: Text('+62 1309 - 1710 - 1920'),
            onTap: () {
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Account'),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Chats'),
            onTap: () {
              // Navigate to chat settings
            },
          ),
          ListTile(
            leading: Icon(Icons.brightness_6),
            title: Text('Appearance'),
            onTap: () {
              // Navigate to appearance settings
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification'),
            onTap: () {
              // Navigate to notification settings
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Privacy'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.data_usage),
            title: Text('Data Usage'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text('Invite Your Friends'),
            onTap: () {},
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.contacts);
                },
                icon: Icon(CupertinoIcons.person_3_fill, color: Colors.black),
              ),
              IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.chat);
                },
                icon: Icon(CupertinoIcons.chat_bubble, color: Colors.black),
              ),
              IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  // Navigator.pushReplacementNamed(context, AppRoutes.settings);
                },
                icon: Icon(Icons.more_horiz, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
