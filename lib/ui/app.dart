import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movil2022a/ui/pages/authentication/login/login_screen.dart';
import 'package:movil2022a/ui/pages/content/cons_general.dart';
import 'package:movil2022a/ui/pages/content/cons_individual.dart';
import 'package:movil2022a/ui/pages/content/content_page.dart';

import 'pages/authentication/user_final/user_final.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Autenticacion Firebase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routes: {
        '/auth': (context) => Login(),
        '/content': (context) => Principal(),
        '/usercomplete': (context) => AgregarCatalogoTI(),
        '/consultaindividual': (context) => ConsIndividual(),
        '/consultageneral': (context) => ConsGeneral(),
      },
      home: Login(),
    );
  }
}
