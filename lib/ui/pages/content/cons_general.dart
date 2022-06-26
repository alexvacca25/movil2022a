import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movil2022a/domain/controller/firestoreconsultas.dart';

class ConsGeneral extends StatelessWidget {
  const ConsGeneral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConsultasController consultaControl = Get.find();
    consultaControl.consultarGral().then((value) => null);
    return Scaffold(
      appBar: AppBar(title: Text('Consulta General')),
      body: Obx(
        () => ListView.builder(
            itemCount: consultaControl.getUserGral!.length == 0
                ? 0
                : consultaControl.getUserGral!.length,
            itemBuilder: (context, posicion) {
              return ListTile(
                leading: Container(
                  padding: EdgeInsets.all(5),
                  width: 50,
                  height: 50,
                  child: Image.network(
                      consultaControl.getUserGral![posicion].foto),
                ),
                title: Text(consultaControl.getUserGral![posicion].nombre),
                subtitle: Text(consultaControl.getUserGral![posicion].apellido),
                trailing: Container(
                  width: 80,
                  height: 40,
                  color: Colors.yellow,
                  child: Text(consultaControl.getUserGral![posicion].telefono),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          consultaControl.consultarGral().then((value) => null);
        },
        child: Icon(Icons.update),
      ),
    );
    ;
  }
}
