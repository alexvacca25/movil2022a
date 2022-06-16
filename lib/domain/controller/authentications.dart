import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Controllerauth extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  late Rx<dynamic> _usuarior = "Sin Registro".obs;
  late Rx<dynamic> _uid = "".obs;
  late Rx<dynamic> _name = "".obs;
  late Rx<dynamic> _photo = "".obs;

  String get emailf => _usuarior.value;
  String get uid => _uid.value;
  String get name => _name.value;
  String get photo => _photo.value;

  Future<void> registrarEmail(dynamic _email, dynamic _passw) async {
    try {
      UserCredential usuario = await auth.createUserWithEmailAndPassword(
          email: _email, password: _passw);

      _usuarior.value = usuario.user!.email;
      _uid.value = usuario.user!.uid;
      _name.value = usuario.user!.email;
      _photo.value = 'https://image.flaticon.com/icons/png/512/17/17004.png';

      await guardarusuario(_usuarior.value, _passw);

      print(usuario);

      return Future.value(true);
      // return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('Correo ya Existe');

        return Future.error('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> ingresarEmail(dynamic email, dynamic pass) async {
    try {
      UserCredential usuario =
          await auth.signInWithEmailAndPassword(email: email, password: pass);
      _usuarior.value = usuario.user!.email;
      _uid.value = usuario.user!.uid;
      _name.value = usuario.user!.email;
      _photo.value =
          'https://noverbal.es/uploads/blog/rostro-de-un-criminal.jpg';

      //    _photo.value = usuario.user!.photoURL;
      await guardarusuario(_usuarior.value, pass);
      print(usuario);
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Correo no encontrado');
        return Future.error('user-not-found');
      } else if (e.code == 'wrong-password') {
        print('Password incorrecto');
        return Future.error('wrong-password');
      }
    }
  }

  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      _usuarior.value = "Sin Registro";
      await guardarusuario('', '');
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<void> guardarusuario(datos, pass) async {
    Future<SharedPreferences> _localuser = SharedPreferences.getInstance();
    final SharedPreferences localuser = await _localuser;
    localuser.setString('email', datos);

    localuser.setString('pass', pass);
    print(localuser.getString('usuario'));
  }
}
