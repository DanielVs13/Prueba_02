import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prueba_02/main.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Record());
}

class Record extends StatelessWidget {
  const Record({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "inicio", debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int idice = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Cuerpo(context),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inico'),
      ),
      body: screens[idice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: idice,
        onTap: (valor) {
          setState(() {
            idice = valor;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: "Historial"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Cuenta"),
        ],
      ),
    );
  }
}

Widget Cuerpo(context) {
  return Scaffold(
    body: SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Transaccion N.1",
                  ),
                  SizedBox(height: 10),
                  Text("Monto: 30"),
                  Text("Tipo: Impuesto"),
                  Text("Saldo: 450"),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Transaccion N.2",
                  ),
                  SizedBox(height: 10),
                  Text("Monto: 45"),
                  Text("Tipo: Impuesto"),
                  Text("Saldo: 400"),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Transaccion N.3",
                  ),
                  SizedBox(height: 10),
                  Text("Monto: 102"),
                  Text("Tipo: Descuento"),
                  Text("Saldo: 800"),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
