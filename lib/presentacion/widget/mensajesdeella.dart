import 'package:cero_app/Domain/entities/message_entities.dart';
import 'package:flutter/material.dart';

class Mensajesdeella extends StatelessWidget {
  final Message messagedeella;
  const Mensajesdeella({super.key, required this.messagedeella});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              messagedeella.text,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        SizedBox(height: 10),
        _ImageB(messagedeella.imageUrl!),
        SizedBox(height: 10),
      ],
    );
  }
}

class _ImageB extends StatelessWidget {
  final String urlImage;

  const _ImageB(this.urlImage);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        urlImage,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,

        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 8.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text('cargando imagen..'),
          );
        },
      ),
    );
  }
}
