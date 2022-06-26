import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:movil2022a/models/usuarios.dart';

class ConsultasController extends GetxController {
// se instancia la base de datos
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  Rxn<List<Usuarios>> _userFirestore = Rxn<List<Usuarios>>();

//Consulta individual
  Stream consultaIndividual(String idBusqueda) {
    Query<Map<String, dynamic>> listaIndividual = _db
        .collection('PerfilUsuarios')
        .where('id_user', isEqualTo: idBusqueda);

    log(listaIndividual
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map(
            (snapshot) => Usuarios.fromMap(snapshot.data()),
          ),
        )
        .toList()
        .toString());

    return listaIndividual.snapshots();
//  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();
//  return pasar.map<Mensajero>((json) => Mensajero.fromJson(json)).toList();
  }

//Consulta general
  Stream<QuerySnapshot> consultaGeneral() {
    CollectionReference listadoGral = _db.collection('PerfilUsuarios');

    return listadoGral.snapshots();
  }

//Consulta por documento

  // Stream<Usuarios?> curUserData(String idBusqueda) {
  //   return _db.collection('users').doc(idBusqueda).snapshots().map(
  //       (DocumentSnapshot<Map<String, dynamic>> snapshot) =>
  //           Usuarios.fromDoc(snapshot.data()));
  // }

//extraer los datos
  List<Usuarios>? get getUser => _userFirestore.value;

//Consultar los datos
  Future<void> consultarUsuario(String idBusqueda) async {
    await _db.collection("PerfilUsuarios").get().then((event) {
      List<Usuarios> _lista = [];
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
        if (doc.id == idBusqueda) {
          _lista.add(Usuarios.fromMap(doc.data()));
        }
      }
      _userFirestore.value = _lista;
      log(_lista.toString());
    });
  }

//Consultar los datos
  Future<void> consultarGral() async {
    await _db.collection("PerfilUsuarios").get().then((event) {
      List<Usuarios> _lista = [];
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");

        _lista.add(Usuarios.fromMap(doc.data()));
      }
      _userFirestore.value = _lista;
      log(_lista.toString());
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    consultaGeneral();
  }
}
