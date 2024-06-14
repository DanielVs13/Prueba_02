import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prueba_02/screens/loginScreen.dart';

void main() {
  runApp(pruebaInicio());
}

class pruebaInicio extends StatelessWidget {
  const pruebaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Inicio",
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
        title: Text("Inicio"),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context) {
  return Scaffold(
    body: Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          "https://cdn.pixabay.com/photo/2014/12/07/09/30/milky-way-559641_960_720.jpg",
          fit: BoxFit.none,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Daniel Antonio Arias Vivanco"),
            Text("DanielVs13"),
            Boton(context),
          ],
        )
      ],
    ),
  );
}

Widget Boton(context) {
  return (FilledButton(
      onPressed: () {
        Alerta(context);
      },
      child: Text("Mensaje")));
}

void Alerta(context) {
  showDialog(
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2014/12/07/09/30/milky-way-559641_960_720.jpg")),
          ),
          child: AlertDialog(
            title: Text("Login"),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text("Acceder"))
            ],
          ),
        );
      });
}
