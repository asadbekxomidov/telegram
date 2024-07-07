// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:path/path.dart';

// class FirestoreService {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;

//   Stream<QuerySnapshot> getMessages(String currentUserId, String recipientId) {
//     return _db
//         .collection('messages')
//         .doc(currentUserId)
//         .collection(recipientId)
//         .orderBy('timestamp', descending: true)
//         .snapshots();
//   }

//   Future<void> sendMessage(
//       String currentUserId, String recipientId, String message) async {
//     await _db
//         .collection('messages')
//         .doc(currentUserId)
//         .collection(recipientId)
//         .add({
//       'senderId': currentUserId,
//       'recipientId': recipientId,
//       'message': message,
//       'timestamp': FieldValue.serverTimestamp(),
//     });
//   }

//   Future<void> sendImageMessage(
//       String currentUserId, String recipientId, String imageUrl) async {
//     await _db
//         .collection('messages')
//         .doc(currentUserId)
//         .collection(recipientId)
//         .add({
//       'senderId': currentUserId,
//       'recipientId': recipientId,
//       'imageUrl': imageUrl,
//       'timestamp': FieldValue.serverTimestamp(),
//     });
//   }

//   Future<String> uploadImage(File image) async {
//     String fileName = basename(image.path);
//     Reference storageReference = FirebaseStorage.instance.ref().child('messages/$fileName');
//     UploadTask uploadTask = storageReference.putFile(image);
//     await uploadTask.whenComplete(() => null);
//     return await storageReference.getDownloadURL();
//   }
  
// }
