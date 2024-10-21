// ignore_for_file: prefer_const_constructors


import 'package:ecommerce/cart/cart_bloc.dart';
import 'package:ecommerce/Firebase/firebase_options.dart';

import 'package:ecommerce/checkout/notificationservice.dart';
import 'package:ecommerce/Login&signup/signin.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  NotificationService notificationService = NotificationService();
  await notificationService.initNotification();

  runApp(
    BlocProvider(
        create: (context) => CartBloc(),
        child: MaterialApp(
          home: SignInpage(),
          debugShowCheckedModeBanner: false,
        )),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
