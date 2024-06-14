import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:prueba_02/screens/recordScreen.dart';

class CuentaScreen extends StatelessWidget {
  const CuentaScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase',
      home: Lista(),
    );
  }
}

class Lista extends StatefulWidget {
  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  List<Map<dynamic, dynamic>> productList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    DatabaseReference productoRef = FirebaseDatabase.instance.ref('usuarios');
    productoRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      updateProductList(data);
    });
  }

  void updateProductList(dynamic data) {
    if (data != null) {
      List<Map<dynamic, dynamic>> tempList = [];
      data.forEach((key, value) {
        tempList.add({
          "Id": value['id'],
          "Producto": value['producto'],
          "Nombre": value['nombre']
        });
      });

      setState(() {
        productList = tempList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View'),
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${productList[index]["producto"]}'),
            subtitle: Text('${productList[index]["productos"]}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Record()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
