import 'package:cero_app/Domain/entities/message_entities.dart';
import 'package:cero_app/presentacion/providers/chat_provider.dart';
import 'package:cero_app/presentacion/widget/mensajes.dart' show Mensajes;
import 'package:cero_app/presentacion/widget/mensajesdeella.dart'
    show Mensajesdeella;
import 'package:cero_app/presentacion/widget/shared/message_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Chatscreen extends StatelessWidget {
  const Chatscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5.8),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8jFkcFNBby48wPq3A71JCXm_P1DDWJOlCHw&s',
            ),
          ),
        ),
        title: Text("chat del amor"),
        centerTitle: true,
      ),
      body: ChatVista(),
    );
  }
}

class ChatVista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.hers)
                      ? Mensajesdeella(messagedeella: message)
                      : Mensajes(messageText: message);
                },
              ),
            ),
            MessageBox(onValue: (value) => chatProvider.sendMenssage(value)),
          ],
        ),
      ),
    );
  }
}
