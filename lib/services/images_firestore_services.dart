// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'dart:io';

// class FirestoreService {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;

//   Stream<QuerySnapshot> getMessages(String currentUserId, String recipientId) {
//     return _db
//         .collection('messages')
//         .doc(currentUserId)
//         .collection(recipientId)
//         .orderBy('timestamp', descending: true)
//         .snapshots();
//   }

//   Future<void> sendMessage(String senderId, String recipientId, String message) async {
//     await _db
//         .collection('messages')
//         .doc(senderId)
//         .collection(recipientId)
//         .add({
//       'senderId': senderId,
//       'recipientId': recipientId,
//       'message': message,
//       'timestamp': FieldValue.serverTimestamp(),
//     });

//     await _db
//         .collection('messages')
//         .doc(recipientId)
//         .collection(senderId)
//         .add({
//       'senderId': senderId,
//       'recipientId': recipientId,
//       'message': message,
//       'timestamp': FieldValue.serverTimestamp(),
//     });
//   }

//   Future<void> sendImageMessage(String senderId, String recipientId, File imageFile) async {
//     String fileName = '${DateTime.now().millisecondsSinceEpoch}.png';
//     Reference storageReference = _storage.ref().child('images/$fileName');
//     UploadTask uploadTask = storageReference.putFile(imageFile);
//     TaskSnapshot snapshot = await uploadTask;
//     String downloadUrl = await snapshot.ref.getDownloadURL();

//     await _db
//         .collection('messages')
//         .doc(senderId)
//         .collection(recipientId)
//         .add({
//       'senderId': senderId,
//       'recipientId': recipientId,
//       'imageUrl': downloadUrl,
//       'timestamp': FieldValue.serverTimestamp(),
//     });

//     await _db
//         .collection('messages')
//         .doc(recipientId)
//         .collection(senderId)
//         .add({
//       'senderId': senderId,
//       'recipientId': recipientId,
//       'imageUrl': downloadUrl,
//       'timestamp': FieldValue.serverTimestamp(),
//     });
//   }
// }



import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getMessages(String currentUserId, String recipientId) {
    return _db
        .collection('messages')
        .doc(currentUserId)
        .collection(recipientId)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Future<void> sendMessage(
      String currentUserId, String recipientId, String message) async {
    await _db
        .collection('messages')
        .doc(currentUserId)
        .collection(recipientId)
        .add({
      'senderId': currentUserId,
      'recipientId': recipientId,
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> sendImageMessage(
      String currentUserId, String recipientId, String imageUrl) async {
    await _db
        .collection('messages')
        .doc(currentUserId)
        .collection(recipientId)
        .add({
      'senderId': currentUserId,
      'recipientId': recipientId,
      'imageUrl': imageUrl,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<String> uploadImage(File image) async {
    String fileName = basename(image.path);
    Reference storageReference = FirebaseStorage.instance.ref().child('messages/$fileName');
    UploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.whenComplete(() => null);
    return await storageReference.getDownloadURL();
  }
  
}


/*

// Example of how you might check and construct Firestore paths

class FirestoreService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<List<Message>> getMessages(String chatId) async {
    // Example of constructing a valid Firestore document path
    String path = 'chats/$chatId/messages'; // Replace with your actual path logic

    if (path.isEmpty) {
      throw ArgumentError('Firestore document path must not be empty');
    }

    // Example of accessing Firestore with the validated path
    QuerySnapshot snapshot = await _firestore.collection(path).get();

    // Process snapshot and return messages
    List<Message> messages = snapshot.docs.map((doc) => Message.fromFirestore(doc)).toList();
    return messages;
  }
}
*/