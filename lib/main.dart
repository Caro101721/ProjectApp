import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'monstan',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.cyanAccent
      ),
      home: ProfileDoom(),
    );
  }
}

class ProfileDoom extends StatelessWidget {
  const ProfileDoom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
        appBar: AppBar(
          title: Text('Mi perfil'),
          backgroundColor: Colors.black,
          foregroundColor: Colors.purple,
        ),
        body: Center(
          child: ProfileVodoo())
        
      );
  }
}

class ProfileVodoo extends StatelessWidget {
  const ProfileVodoo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
        ) ,
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Foto de perfil
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWuHXchPBTF_z-Vk1nMaU9wdtvU6QYZZahuA&s?'),
                //child: Icon(
                  //Icons.person,
                  //size: 60,
                  //color: Colors.white,
                ),
             // ),
              SizedBox(height: 20),
              //Nombre
              Text(
                'Danna Puerta',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
               ),
               SizedBox(height: 8),

               //Email
               Text(
                'dannapuerta@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange
                ),
               ),
               SizedBox(height: 8),

               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      //Metodo algo
                      _mostrarMensaje(context, 'Llamando...');
                    },
                    icon: Icon(Icons.phone_android_outlined),
                    label: Text('Llamar'),
                    style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: Colors.green,
                      foregroundColor: Colors.blue
                    ),
                  ),
                  SizedBox(height: 30),
                  //Boton mensaje
                  ElevatedButton.icon(
                    onPressed: () {
                      _mostrarMensaje(context, 'Enviando mensaje a Danna Puerta');
                    },
                    icon: Icon(Icons.message),
                    label: Text('Mensaje'),
                    style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: Colors.black,
                      foregroundColor: Colors.black,
                    ),
                  ),
                ],
               ),
               SizedBox(height: 18),
               //Boton editar perfil
               SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                  },
                  icon: Icon(Icons.edit),
                  label: Text('Editar perfil'),
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: Colors.black,
                    foregroundColor: Colors.black,
                  ),
                ),
               ),
            ],
          ),

        ),
        ),
    );
  }
  //Funcion de mensajes
  void _mostrarMensaje(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        duration: Duration(seconds: 10),
        backgroundColor: Colors.cyan,
      )
    );
  }

}
