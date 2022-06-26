import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movil2022a/domain/controller/authentications.dart';
import 'package:movil2022a/domain/controller/firestoreconsultas.dart';

class ConsIndividual extends StatefulWidget {
  const ConsIndividual({Key? key}) : super(key: key);

  @override
  State<ConsIndividual> createState() => _ConsIndividualState();
}

class _ConsIndividualState extends State<ConsIndividual> {
  Controllerauth controluser = Get.find();
  ConsultasController controlconsultas = Get.find();
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlApellido = TextEditingController();
  TextEditingController controlDireccion = TextEditingController();
  TextEditingController controlTelefono = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consulta Individual')),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: controlNombre,
              decoration: InputDecoration(labelText: "Nombre"),
            ),
            TextField(
              controller: controlApellido,
              decoration: InputDecoration(labelText: "Apellido"),
            ),
            TextField(
              controller: controlDireccion,
              decoration: InputDecoration(labelText: "Direccion"),
            ),
            TextField(
              controller: controlTelefono,
              decoration: InputDecoration(labelText: "Telefono"),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    controlconsultas.consultarUsuario(controluser.uid);
                    controlNombre.text = controlconsultas.getUser![0].nombre;
                  });
                },
                child: Text('Consultar'))
          ],
        ),
      ),
    );
  }
}
