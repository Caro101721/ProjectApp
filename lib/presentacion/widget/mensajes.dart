import 'package:cero_app/Domain/entities/message_entities.dart';
import 'package:flutter/material.dart';

class Mensajes extends StatelessWidget {
  final Message messageText;

  const Mensajes({super.key, required this.messageText});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              messageText.text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
