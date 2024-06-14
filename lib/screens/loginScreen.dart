import 'package:flutter/material.dart';
import 'package:prueba_02/main.dart';
import 'package:prueba_02/screens/registerScreen.dart';

void main() {
  runApp(LoginScreen());
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Login",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" LOGIN "),
      ),
      body: Cuerpo(context),
    );
  }
}

final TextEditingController _email = TextEditingController();
final TextEditingController _password = TextEditingController();
Widget Cuerpo(context) {
  return Scaffold(
    body: Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Text("Inicio Sesion"),
            SizedBox(height: 10),
            TextField(
              controller: _email,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(242, 179, 96, 194),
                  hintText: "Correo Electronico"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _password,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(242, 179, 96, 194),
                  hintText: "Contraseña"),
            ),
            SizedBox(
              height: 10,
            ),
            FilledButton(
              onPressed: () {
                Login(context);
              },
              child: Text("Inicio Sesion"),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Register(),
                  ),
                );
              },
              child: const Text(
                'Registrarse',
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
