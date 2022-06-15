import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movil2022a/ui/app.dart';

import 'domain/controller/authentications.dart';
import 'domain/controller/connectivity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(Controllerauth());

  ConnectivityController connectivityController =
      Get.put(ConnectivityController());
  Connectivity().onConnectivityChanged.listen((connectivityStatus) {
    connectivityController.connectivity = connectivityStatus;
  });

  runApp(MyApp());
}
