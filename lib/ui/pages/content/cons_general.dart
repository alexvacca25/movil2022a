import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movil2022a/domain/controller/firestoreconsultas.dart';

class ConsGeneral extends StatelessWidget {
  const ConsGeneral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConsultasController consultaControl = Get.find();
    return Scaffold(
      appBar: AppBar(title: Text('Consulta General')),
      body: Obx(() => ListView.builder(
          itemCount: consultaControl.getUser!.length == 0
              ? 0
              : consultaControl.getUser!.length,
          itemBuilder: (context, posicion) {
            return ListTile(
              leading: Container(
                padding: EdgeInsets.all(5),
                width: 50,
                height: 50,
                child: Image.network(consultaControl.getUser![posicion].foto),
              ),
              title: Text(consultaControl.getUser![posicion].nombre),
              subtitle: Text(consultaControl.getUser![posicion].apellido),
              trailing: Container(
                width: 80,
                height: 40,
                color: Colors.yellow,
                child: Text(consultaControl.getUser![posicion].telefono),
              ),
            );
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          consultaControl.consultaGeneral();
        },
        child: Icon(Icons.update),
      ),
    );
  }
}
