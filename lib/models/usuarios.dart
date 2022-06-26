//User Model
import 'package:cloud_firestore/cloud_firestore.dart';

class Usuarios {
  final String idUser;
  final String nombre;
  final String apellido;
  final String direccion;
  final String telefono;
  final String foto;

  Usuarios(
      {required this.idUser,
      required this.nombre,
      required this.apellido,
      required this.direccion,
      required this.telefono,
      required this.foto});

  factory Usuarios.fromMap(Map<String, dynamic> data) {
    return Usuarios(
      idUser: data['id_user'] ?? '',
      nombre: data['nombre'] ?? '',
      apellido: data['apellido'] ?? '',
      direccion: data['direccion'] ?? '',
      telefono: data['telefono'] ?? '',
      foto: data['foto'] ?? '',
    );
  }

  factory Usuarios.fromDoc(Map<String, dynamic> data) {
    return Usuarios(
      idUser: data['id_user'] ?? '',
      nombre: data['nombre'] ?? '',
      apellido: data['apellido'] ?? '',
      direccion: data['direccion'] ?? '',
      telefono: data['telefono'] ?? '',
      foto: data['foto'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "nombre": nombre,
        "apellido": apellido,
        "direccion": direccion,
        "foto": telefono
      };
}
