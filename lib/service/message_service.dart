import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share_txt/model/message.dart';

class MessageService {
  final Firestore _db = Firestore.instance;

  Stream<List<Message>> streamMessages() {
    var ref = _db.collection('messages');

    return ref.orderBy('timestamp', descending: false).snapshots().map(
        (list) => list.documents.map((doc) => Message.fromJson(doc)).toList());
  }

  Future send(String content) async {
    if (content == null || content.isEmpty) {
      return;
    }
    var ref = _db.collection('messages').document();
    return ref.setData(Message.create(ref.documentID, content).toJson());
  }
}
