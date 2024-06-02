import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:minimal_chat_app/model/message.dart';

class ChatProvider extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<Map<String, dynamic>>>? getUsersStream() {
    try {
      return firestore
          .collection('users')
          .where('email', isNotEqualTo: firebaseAuth.currentUser!.email)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) {
          final user = doc.data();

          return user;
        }).toList();
      });
    } catch (e) {
      print(e);
    }
    return null;
  }

//send Message
  Future<void> sendMessage(
      {required String messageContent, required String reciverId}) async {
    try {
      String currentId = firebaseAuth.currentUser!.uid;
      String currentEmail = firebaseAuth.currentUser!.email!;
      final Timestamp timestamp = Timestamp.now();

      Message message = Message(
          senderId: currentId,
          senderEmail: currentEmail,
          reciverId: reciverId,
          message: messageContent,
          timestamp: timestamp);

      List<String> ids = [currentId, reciverId];
      ids.sort();

      String chatroomId = ids.join('_');

      await firestore
          .collection("chat_rooms")
          .doc(chatroomId)
          .collection("messages")
          .add(message.toMap());

      //
    } catch (e) {
      print(e);
    }
  }

//getMessages
  Stream<QuerySnapshot> getMessages(
      {required String SenderId, required String ReciverId}) {
    List<String> ids = [SenderId, ReciverId];
    ids.sort();
    String chatroomId = ids.join('_');

    return firestore
        .collection("chat_rooms")
        .doc(chatroomId)
        .collection("messages")
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  //
}
