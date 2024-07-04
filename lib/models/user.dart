// import 'package:cloud_firestore/cloud_firestore.dart';

// class UsersModel {
//   String id;
//   String name;
//   String email;
//   String surname;
//   String message;
//   String avatarUrl;
//   String userId;

//   UsersModel({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.surname,
//     required this.message,
//     required this.avatarUrl,
//     required this.userId,
//   });

//   factory UsersModel.fromMap(DocumentSnapshot doc) {
//     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

//     return UsersModel(
//       id: doc.id,
//       name: data['name'] ?? '',
//       email: data['email'] ?? '',
//       surname: data['surname'] ?? '',
//       message: data['message'] ?? '',
//       avatarUrl: data['avatarUrl'] ?? '',
//       userId: data['userId'] ?? '',
//     );
//   }

//   Future<void> sendMessageToUser(String recipientUserId, String message) async {
//     try {
//       CollectionReference messagesCollection = FirebaseFirestore.instance.collection('messages');

//       await messagesCollection.doc(recipientUserId).collection('chats').add({
//         'senderId': this.userId,
//         'message': message,
//         'timestamp': Timestamp.now(),
//       });

//       await messagesCollection.doc(this.userId).collection('chats').add({
//         'recipientId': recipientUserId,
//         'message': message,
//         'timestamp': Timestamp.now(),
//       });

//     } catch (e) {
//       print('Error sending message: $e');
//     }
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';

// class UsersModel {
//   String id;
//   final String name;
//   String email;
//   String surname;
//   String message;
//   String avatarUrl;
//   String userId;

//   UsersModel({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.surname,
//     required this.message,
//     required this.avatarUrl,
//     required this.userId,
//   });

//   factory UsersModel.fromMap(DocumentSnapshot doc) {
//     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

//     return UsersModel(
//       id: doc.id,
//       name: data['name'] ?? '',
//       email: data['email'] ?? '',
//       surname: data['surname'] ?? '',
//       message: data['message'] ?? '',
//       avatarUrl: data['avatarUrl'] ?? '',
//       userId: data['userId'] ?? '',
//     );
//   }

//   Future<void> sendMessageToUser(String recipientUserId, String message) async {
//     try {
//       CollectionReference messagesCollection =
//           FirebaseFirestore.instance.collection('messages');

//       await messagesCollection.doc(recipientUserId).collection('chats').add({
//         'senderId': this.userId,
//         'message': message,
//         'timestamp': Timestamp.now(),
//       });

//       await messagesCollection.doc(this.userId).collection('chats').add({
//         'recipientId': recipientUserId,
//         'message': message,
//         'timestamp': Timestamp.now(),
//       });
//     } catch (e) {
//       print('Error sending message: $e');
//     }
//   }
// }



import 'package:cloud_firestore/cloud_firestore.dart';

class UsersModel {
  String id;
  String name;
  String email;
  String surname;
  String message;
  String avatarUrl;
  String userId;

  UsersModel({
    required this.id,
    required this.name,
    required this.email,
    required this.surname,
    required this.message,
    required this.avatarUrl,
    required this.userId,
  });

  factory UsersModel.fromMap(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return UsersModel(
      id: doc.id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      surname: data['surname'] ?? '',
      message: data['message'] ?? '',
      avatarUrl: data['avatarUrl'] ?? '',
      userId: data['userId'] ?? '',
    );
  }

  Future<void> sendMessageToUser(String recipientUserId, String message) async {
    try {
      CollectionReference messagesCollection = FirebaseFirestore.instance.collection('messages');

      await messagesCollection.doc(recipientUserId).collection('chats').add({
        'senderId': this.userId,
        'message': message,
        'timestamp': Timestamp.now(),
      });

      await messagesCollection.doc(this.userId).collection('chats').add({
        'recipientId': recipientUserId,
        'message': message,
        'timestamp': Timestamp.now(),
      });

    } catch (e) {
      print('Error sending message: $e');
    }
  }
}