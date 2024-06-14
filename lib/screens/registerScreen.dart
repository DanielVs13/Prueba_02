import 'package:flutter/material.dart';
import 'package:prueba_02/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prueba_02/screens/loginScreen.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(Register());
}

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' ',
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
        title: const Text('registro'),
      ),
      body: Cuerpo(context),
    );
  }
}

final TextEditingController _user = TextEditingController();
final TextEditingController _id = TextEditingController();
final TextEditingController _email = TextEditingController();
final TextEditingController _password = TextEditingController();

Widget Cuerpo(context) {
  return Scaffold(
    body: Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Registro",
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _id,
                decoration: const InputDecoration(
                  hintText: "id",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _user,
                decoration: const InputDecoration(
                  hintText: "nombre",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _email,
                decoration: const InputDecoration(
                  hintText: "Correo Electronico",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _password,
                decoration: const InputDecoration(
                  hintText: "Contraseña",
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Login(context);
                  Guardar();
                },
                child: const Text(
                  'Registrar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
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
                  'Registrate',
                  style: TextStyle(
                      color: Colors.white, decoration: TextDecoration.overline),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget Boton(context) {
  return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => pruebaInicio()));
      },
      child: Text("Volver al inicio"));
}

Future<void> Login(context) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _email.text,
      password: _password.text,
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

void Guardar() async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("usuarios/" + _id.text);

  await ref.set({
    "id": _id.text,
    "correo": _email.text,
    "nike": _user.text,
  });
}
