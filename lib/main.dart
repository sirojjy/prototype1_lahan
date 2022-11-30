import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prototype1_lahan/inventarisasi/bloc/inven_bloc.dart';
import 'package:prototype1_lahan/inventarisasi/inventarisasi.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),

      routes: {
        CustomRoutes.dashboard : (context) => const Dashboard(),
        CustomRoutes.inventarisasi : (context) => const Inventarisasi(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dashboard();
  }
}

