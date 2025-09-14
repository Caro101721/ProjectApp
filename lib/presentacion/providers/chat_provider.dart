import 'package:cero_app/Domain/entities/message_entities.dart'
    show FromWho, Message;
import 'package:cero_app/config/helpers/get_yes_no_answer.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Bienvenido al chat', fromWho: FromWho.mys),
    Message(text: 'Te encuentras bien?', fromWho: FromWho.mys),
  ];

  Future<void> sendMenssage(String text) async {
    if (text.isEmpty) return;

    final newMenssage = Message(text: text, fromWho: FromWho.mys);
    messageList.add(newMenssage);

    if (text.endsWith('?')) {
      await herReply();
    }
    notifyListeners();
    movelScrollTom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    movelScrollTom();
  }

  Future<void> movelScrollTom() async {
    await Future.delayed(const Duration(microseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(microseconds: 250),
      curve: Curves.easeOut,
    );
  }
}
