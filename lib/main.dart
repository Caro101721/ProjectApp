import 'package:cero_app/presentacion/providers/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cero_app/config/Tema/app_tema.dart' show AppTema;
import 'package:cero_app/presentacion/screen/chatscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        title: 'Yes No App',
        debugShowCheckedModeBanner: false,
        theme: AppTema(selectcolor: 2).tema(),
        home: const Chatscreen(),
      ),
    );
  }
}
