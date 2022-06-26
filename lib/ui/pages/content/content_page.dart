import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movil2022a/domain/controller/authentications.dart';
import 'package:movil2022a/domain/controller/firestoreconsultas.dart';

class Principal extends StatelessWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConsultasController consultasControl = Get.find();
    Controllerauth controluser = Get.find();
    consultasControl.consultarGral();
    consultasControl.consultaIndividual(controluser.uid);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.offNamed('/consultaindividual');
              },
              icon: Icon(Icons.edit)),
          IconButton(onPressed: () {}, icon: Icon(Icons.list))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(controluser.emailf)),
            Text(controluser.uid),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/usercomplete');
                },
                child: Text('Completar Datos')),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/consultaindividual');
                },
                child: Text('Consulta Individual')),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/consultageneral');
                },
                child: Text('Consulta General')),
          ],
        ),
      ),
    );
  }
}
