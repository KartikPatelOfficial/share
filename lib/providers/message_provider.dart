import 'package:share_txt/model/message.dart';
import 'package:share_txt/service/message_service.dart';

class MessageProvider {
  MessageService messageService = MessageService();

  Stream<List<Message>> get streamMessage => messageService.streamMessages();

  Future sendMessage(String content) async {
    messageService.send(content);
  }
}
