import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Message {
  String id;
  String content;
  Timestamp timestamp;

  Message(
      {@required this.id, @required this.content, @required this.timestamp});

  factory Message.fromJson(DocumentSnapshot doc) {
    return Message(
        id: doc.documentID,
        content: doc.data['content'],
        timestamp: doc.data['timestamp']);
  }

  factory Message.create(String id, String content) {
    return Message(id: id, content: content, timestamp: Timestamp.now());
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'content': content, 'timestamp': timestamp};
  }
}
