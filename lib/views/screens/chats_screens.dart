import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telegram/utils/app_routes.dart';

class ChatsScreens extends StatelessWidget {
  const ChatsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.messenger_outline)),
          IconButton(onPressed: () {}, icon: Icon(Icons.list)),
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
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.chat_bubble, color: Colors.black)),
              IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.settings);
                  },
                  icon: Icon(Icons.more_horiz, color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
