import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prototype1_lahan/authentification/login.dart';
import 'package:prototype1_lahan/inventarisasi/bloc/inven_bloc.dart';
import 'package:prototype1_lahan/inventarisasi/inventarisasi.dart';
import 'package:prototype1_lahan/inventarisasi/test_image_picker.dart';
import 'dashboard/dashboard.dart';
import 'share/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) =>InvenBloc())
        ],
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference inventarisasi = firestore.collection('inventarisasi');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),

      routes: {
        CustomRoutes.loginPage : (context) => const LoginPage(),
        CustomRoutes.dashboard : (context) => const Dashboard(),
        CustomRoutes.inventarisasi : (context) => const Inventarisasi(),
        CustomRoutes.imagePicker : (context) => const ImagePicker(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}

