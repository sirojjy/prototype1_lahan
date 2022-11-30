import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype1_lahan/dashboard/DokumenInfo.dart';

import '../inventarisasi/inventarisasi.dart';
import '../share/custom_appbar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(judulMenu: 'Dashboard',),
      body: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: DokumenInfo(),)
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}