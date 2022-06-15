import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:movil2022a/domain/controller/authentications.dart';
import 'package:movil2022a/domain/controller/connectivity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailuser = TextEditingController();
  TextEditingController passwuser = TextEditingController();

  Controllerauth controluser = Get.find();
  late ConnectivityController connectivityController;

  @override
  void initState() {
    super.initState();
    connectivityController = Get.find<ConnectivityController>();
    autoLogIn();
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? email = prefs.getString('email');
    final String? passw = prefs.getString('pass');

    if (email != null) {
      setState(() {
        emailuser.text = email;
        passwuser.text = passw!;
        if (controluser.emailf != 'Sin Registro')
          _inicio(emailuser.text, passwuser.text);
      });
      return;
    }
  }

  _login(theEmail, thePassword) async {
    print('_login $theEmail $thePassword');
    try {
      await controluser.registrarEmail(theEmail, thePassword);
      //  Get.to(() => ListaMensajes());
      // Get.to(() => ListaMensajeros2(title: 'Titulo'));
      if (controluser.emailf != 'Sin Registro') {
        Get.offNamed('/content');
      } else {
        Get.snackbar(
          "Login",
          'Ingrese un Email Valido',
          icon: Icon(Icons.person, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (err) {
      print(err.toString());
      Get.snackbar(
        "Login",
        err.toString(),
        icon: Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  _inicio(theEmail, thePassword) async {
    print('_login $theEmail $thePassword');
    try {
      await controluser.ingresarEmail(theEmail, thePassword);
      //  Get.to(() => ListaMensajes());
      //Get.to(() => ListaMensajeros2(title: 'Titulo'));
      if (controluser.emailf != 'Sin Registro') {
        Get.offNamed('/content');
      } else {
        Get.snackbar(
          "Login",
          'Ingrese un Email Valido',
          icon: Icon(Icons.person, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (err) {
      print(err.toString());
      Get.snackbar(
        "Login",
        err.toString(),
        icon: Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /* CircleAvatar(
                radius: 50.0,
                child: ClipRRect(
                  child: Image.asset('assets/login.png'),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),*/
              CircleAvatar(
                  radius: 80.0,
                  backgroundImage: NetworkImage(
                      'https://login.gov/assets/img/login-gov-288x288.png')),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: emailuser,
                decoration: InputDecoration(hintText: 'Ingrese el Email'),
              ),
              TextField(
                controller: passwuser,
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        if (connectivityController.connected) {
                          _inicio(emailuser.text, passwuser.text);
                        } else {
                          GetSnackBar(
                            title: 'No esta conectado a un Red',
                            duration: Duration(seconds: 5),
                          );
                        }
                      },
                      icon: Icon(Icons.login)),
                  IconButton(
                      onPressed: () {
                        if (connectivityController.connected) {
                          _login(emailuser.text, passwuser.text);
                        } else {
                          GetSnackBar(
                            title: 'No esta conectado a un Red',
                            duration: Duration(seconds: 5),
                          );
                        }
                      },
                      icon: Icon(Icons.app_registration))
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (connectivityController.connected) {
          } else {
            GetSnackBar(
              title: 'No esta conectado a un Red',
              duration: Duration(seconds: 5),
            );
          }
        },
        child: FaIcon(
          FontAwesomeIcons.google,
          color: Colors.white,
        ),
      ),
    );
  }
}
