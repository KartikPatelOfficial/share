import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:share_txt/model/device.dart';

class Message {
  String id;
  String content;
  Timestamp timestamp;
  Device device;

  Message(
      {@required this.id,
      @required this.content,
      @required this.timestamp,
      @required this.device});

  factory Message.fromJson(DocumentSnapshot doc) {
    return Message(
        id: doc.documentID,
        content: doc.data['content'],
        timestamp: doc.data['timestamp'],
        device: Device.fromJson(doc.data['device']));
  }

  factory Message.create(String id, String content, Device device) {
    return Message(
        id: id, content: content, timestamp: Timestamp.now(), device: device);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'content': content, 'timestamp': timestamp, 'device' : device.toJson()};
  }
}
