import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototype1_lahan/dashboard/dashboard.dart';
import 'package:prototype1_lahan/share/item.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Logo
              Text(
                'E - Lahan',
                style: GoogleFonts.bebasNeue(
                  textStyle: TextStyle(
                    fontSize: 40
                  ),
                )
              ),
              const SizedBox(height: 20,),

              //Hallo
               Text(
                'Halo! Silahkan Login',
                style: GoogleFonts.bebasNeue(
                  textStyle: TextStyle(
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
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: TextField(
                      decoration:
                      InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Username',
                      ),
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
                    child: const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: TextField(
                          obscureText: true,
                          decoration:
                          InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Username',
                          ),
                        ),
                    ),
                ),
              ),
              const SizedBox(height: 20,),

              //Sign in button
              Padding(padding:
                 EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: () => {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){ return Dashboard();}))
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
          ),
        )
      )
    );
  }
}

