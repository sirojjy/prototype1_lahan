import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype1_lahan/dashboard/DokumenInfo.dart';
import 'package:prototype1_lahan/dashboard/model/myCard.dart';
import 'package:prototype1_lahan/dashboard/musyawarah.dart';
import 'package:prototype1_lahan/dashboard/pengumuman.dart';
import 'package:prototype1_lahan/inventarisasi/test_image_picker.dart';
import 'package:prototype1_lahan/share/appbarNew.dart';

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
        child: Column(
          children: [
            //appbar
            AppbarNew(title: 'Dashboard'),

            //card
            MyCard(),
            //
          ],
          ),
        )
      );
  }
}
