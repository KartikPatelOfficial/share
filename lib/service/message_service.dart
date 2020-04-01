import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share_txt/model/message.dart';
import 'package:share_txt/service/device_service.dart';

class MessageService {
  final Firestore _db = Firestore.instance;
  final DeviceService _deviceService = DeviceService();

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
    var device = await _deviceService.getDeviceDetails();
    return ref
        .setData(Message.create(ref.documentID, content, device).toJson());
  }
}
