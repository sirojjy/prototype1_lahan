import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype1_lahan/dashboard/DokumenInfo.dart';
import 'package:prototype1_lahan/dashboard/musyawarah.dart';
import 'package:prototype1_lahan/dashboard/pengumuman.dart';
import 'package:prototype1_lahan/inventarisasi/test_image_picker.dart';

import '../inventarisasi/inventarisasi.dart';
import '../share/custom_appbar.dart';
import '../share/item.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: DokumenInfo(),),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Pengumuman(),),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Musyawarah(),),
                ],
              ),

              SizedBox(height: 20,),


              // ElevatedButton(
              //     onPressed: () => {
              //       Navigator.push(context, MaterialPageRoute(builder: (context) => const ImagePicker()))
              //     },
              //     child: Text('Tambah Gambar')
              // ),
            ],
          ),
        )
      ),
    );
  }
}
