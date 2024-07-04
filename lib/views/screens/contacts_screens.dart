import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telegram/controllers/users_controller.dart';
import 'package:telegram/models/user.dart';
import 'package:telegram/utils/app_routes.dart';
import 'package:telegram/views/screens/messages_screen.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  void initState() {
    super.initState();
    final userId = 'currentUserId';
    context.read<UsersController>().fetchCurrentUser(userId);
  }

  @override
  Widget build(BuildContext context) {
    final usersController = context.watch<UsersController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: usersController.list,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
            return Center(
              child: Text('No users available'),
            );
          }
          final users = snapshot.data.docs;
          final currentUser = usersController
              .currentUser; // Assuming you have a way to get the current user

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = UsersModel.fromMap(users[index]);

              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => MessagesScreen(
                        currentUserId: currentUser?.userId ?? '',
                        recipientId: user.userId,
                        user: user.name,
                      ),
                    ),
                  );
                },
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(
                      255,
                      Random().nextInt(255),
                      170 + Random().nextInt(85),
                      Random().nextInt(255),
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "${user.name[0]}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                title: Text(user.name),
              );
            },
          );
        },
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
                  // Navigator.pushReplacementNamed(context, AppRoutes.myAccount); // Use AppRoutes.myAccount for My Account screen
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
                  Navigator.pushReplacementNamed(context, AppRoutes.settings);
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
