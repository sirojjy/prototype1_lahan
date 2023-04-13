import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prototype1_lahan/authentification/screen/login.dart';
import 'package:prototype1_lahan/dashboard/bloc/dashboard_bloc.dart';
import 'package:prototype1_lahan/dashboard/part_dashboard/kategori/bloc/kategori_bloc.dart';
import 'package:prototype1_lahan/dashboard/part_dashboard/kategori_card/kategori_card_bloc.dart';
import 'package:prototype1_lahan/inventarisasi/inventarisasi.dart';
import 'package:prototype1_lahan/inventarisasi/test_image_picker.dart';
import 'authentification/bloc/auth_bloc.dart';
import 'dashboard/dashboard.dart';
import 'share/routes.dart';

// Future<void> main() async {
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(
      MultiBlocProvider(
        providers: [

          // Mendaftarkan semua BLOC
          BlocProvider(create: (BuildContext context) =>AuthBloc()),
          BlocProvider(create: (BuildContext context) =>DashboardBloc()),
          BlocProvider(create: (BuildContext context) =>KategoriBloc()),
          BlocProvider(create: (BuildContext context) =>KategoriCardBloc()),
        ],
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    // CollectionReference inventarisasi = firestore.collection('inventarisasi');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),

      routes: {
        CustomRoutes.loginPage : (context) =>  LoginPage(),
        CustomRoutes.dashboard : (context) =>  Dashboard(),
        CustomRoutes.inventarisasi : (context) =>  Inventarisasi(),
        CustomRoutes.imagePicker : (context) =>  ImagePicker(),
      },
    );
  }
}

