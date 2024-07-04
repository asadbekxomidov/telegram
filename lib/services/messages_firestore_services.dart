import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference messagesCollection =
      FirebaseFirestore.instance.collection('messages');

  // Fetch messages between two users
  Stream<QuerySnapshot> getMessages(String currentUserId, String recipientId) {
    return messagesCollection
        .where('participants', arrayContains: currentUserId)
        .snapshots();
  }

  // Send message
  Future<void> sendMessage(String senderId, String recipientId, String message) async {
    try {
      await messagesCollection.add({
        'senderId': senderId,
        'recipientId': recipientId,
        'message': message,
        'timestamp': Timestamp.now(),
        'participants': [senderId, recipientId]
      });
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  sendImageMessage(String currentUserId, String recipientId, File file) {}
}
