import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:telegram/services/messages_firestore_services.dart';

class MessagesScreen extends StatefulWidget {
  final String currentUserId;
  final String recipientId;
  final String user;

  MessagesScreen(
      {required this.currentUserId,
      required this.recipientId,
      required this.user});

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final FirestoreService _firestoreService = FirestoreService();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _firestoreService.getMessages(
                  widget.currentUserId, widget.recipientId),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No messages available'));
                }
                final messages = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isSentByCurrentUser =
                        message['senderId'] == widget.currentUserId;
                    return ListTile(
                      title: Text(
                        message['message'],
                        style: TextStyle(fontSize: 12),
                      ),
                      // subtitle: Text(message['timestamp'].toDate().toString()),
                      subtitle: Text(
                        DateFormat('yyyy-MM-dd HH:mm:ss')
                            .format(message['timestamp'].toDate()),
                        style: TextStyle(fontSize: 8),
                      ),
                      // trailing: isSentByCurrentUser ? Icon(Icons.send) : null,
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Enter message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _firestoreService.sendMessage(
                      widget.currentUserId,
                      widget.recipientId,
                      _messageController.text,
                    );
                    _messageController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}








// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:telegram/services/images_firestore_services.dart';

// class MessagesScreen extends StatefulWidget {
//   final String currentUserId;
//   final String recipientId;
//   final String user;

//   MessagesScreen(
//       {required this.currentUserId,
//       required this.recipientId,
//       required this.user});

//   @override
//   _MessagesScreenState createState() => _MessagesScreenState();
// }

// class _MessagesScreenState extends State<MessagesScreen> {
//   final FirestoreService _firestoreService = FirestoreService();
//   final TextEditingController _messageController = TextEditingController();
//   final ImagePicker _picker = ImagePicker();
//   File? _imageFile;

//   Future<void> _pickImage(ImageSource source) async {
//     final pickedFile = await _picker.pickImage(source: source);
//     setState(() {
//       if (pickedFile != null) {
//         _imageFile = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   Future<void> _sendImageMessage() async {
//     if (_imageFile != null) {
//       String imageUrl = await _firestoreService.uploadImage(_imageFile!);
//       await _firestoreService.sendImageMessage(
//         widget.currentUserId,
//         widget.recipientId,
//         imageUrl,
//       );
//       setState(() {
//         _imageFile = null;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.user),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder(
//               stream: _firestoreService.getMessages(
//                   widget.currentUserId, widget.recipientId),
//               builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                   return Center(child: Text('No messages available'));
//                 }
//                 final messages = snapshot.data!.docs;
//                 return ListView.builder(
//                   itemCount: messages.length,
//                   itemBuilder: (context, index) {
//                     final message = messages[index];
//                     final isSentByCurrentUser =
//                         message['senderId'] == widget.currentUserId;
//                     return ListTile(
//                       title: message['imageUrl'] != null
//                           ? Image.network(message['imageUrl'])
//                           : Text(message['message']),
//                       subtitle: Text(message['timestamp'].toDate().toString()),
//                       trailing: isSentByCurrentUser ? Icon(Icons.send) : null,
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           if (_imageFile != null)
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Image.file(_imageFile!),
//             ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.photo),
//                   onPressed: () => _pickImage(ImageSource.gallery),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.camera_alt),
//                   onPressed: () => _pickImage(ImageSource.camera),
//                 ),
//                 Expanded(
//                   child: TextField(
//                     controller: _messageController,
//                     decoration: InputDecoration(
//                       hintText: 'Enter message...',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () {
//                     if (_imageFile != null) {
//                       _sendImageMessage();
//                     } else {
//                       _firestoreService.sendMessage(
//                         widget.currentUserId,
//                         widget.recipientId,
//                         _messageController.text,
//                       );
//                       _messageController.clear();
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
