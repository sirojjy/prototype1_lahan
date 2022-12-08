import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototype1_lahan/authentification/auth_bloc.dart';
import 'package:prototype1_lahan/dashboard/dashboard.dart';
import 'package:prototype1_lahan/share/item.dart';
import 'package:prototype1_lahan/share/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  String message1 = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if(state.status.isSuccess){
                Navigator.pushNamedAndRemoveUntil(context, CustomRoutes.dashboard, (route) => false);
              }
          },
          builder: (context, state) {
            return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Logo
              Text(
                'E - Lahan IKN',
                style: GoogleFonts.bebasNeue(
                  textStyle: const TextStyle(
                    fontSize: 40
                  ),
                )
              ),
              const SizedBox(height: 20,),

              //Hallo
               Text(
                'Halo! Silahkan Login',
                style: GoogleFonts.bebasNeue(
                  textStyle: const TextStyle(
                      fontSize: 24
                  ),
                ),
              ),
              const SizedBox(height: 40,),

              //Username
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                    border: Border.all(color: thirdColor),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: TextField(
                      decoration:
                      InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Username',
                      ),
                      controller: usernameController,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),

              //Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: whiteColor,
                        border: Border.all(color: thirdColor),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child:  Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: TextField(
                          obscureText: true,
                          decoration:
                          InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                          controller: passwordController,
                        ),
                    ),
                ),
              ),
              const SizedBox(height: 20,),

              //Sign in button
              Padding(padding:
                 const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: () {
                    context.read<AuthBloc>().add(OnLoginEvent(
                        username: usernameController.text,
                        password: passwordController.text,
                    ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: const Center(
                      child: Text(
                        "Masuk",
                        style: TextStyle(
                            color: whiteColor,
                            fontWeight:  FontWeight.bold,
                            fontSize: 18
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              
              //Forgot Password
              const Text(
                'Lupa password?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ],
          );
  },
),
        )
      )
    );
  }
}

