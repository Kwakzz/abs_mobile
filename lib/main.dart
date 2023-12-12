import 'package:ashesi_bus/driver_pages/nav_tabs/entry.dart';
import 'package:ashesi_bus/models/driver_pref.dart';
import 'package:ashesi_bus/pages/account/login.dart';
import 'package:ashesi_bus/pages/nav_tabs/entry.dart';
import 'package:ashesi_bus/models/bus_user_pref.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// check if user is logged in
// if logged in, show entry page
// if not logged in, show login page


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: await BusUserPref().isBusUserLoggedIn() ? const Entry() : await DriverPref().isDriverLoggedIn() ? const DriverEntry() : const Login(),
    )
  );

}
