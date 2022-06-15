import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('prueba').snapshots(),
              builder:
                  (BuildContext contex, AsyncSnapshot<QuerySnapshot> snapShot) {
                if (snapShot.hasData) {
                  List data = snapShot.data!.docs;
                  return Column(
                    children: List.generate(
                        data.length, (index) => Text(data[index]['nombre'])),
                  );
                } else {
                  return Text('Sin datos');
                }
              }),
        ],
      ),
    );
  }
}
