import 'package:flutter/material.dart';
import 'package:flutter_tab_indicator_styler/flutter_tab_indicator_styler.dart';
import 'package:intl/intl.dart';
import 'package:prototype1_lahan/dashboard/bloc/dashboard_bloc.dart';
import 'package:prototype1_lahan/dashboard/model/bidang_pie_chart.dart';
import 'package:prototype1_lahan/dashboard/model/kelengkapan_dok_bar.dart';
import 'package:prototype1_lahan/dashboard/model/luas_chart_donut.dart';
import 'package:prototype1_lahan/dashboard/model/my_card.dart';
import 'package:prototype1_lahan/dashboard/part_dashboard/kategori_card/kategori_card.dart';
import 'package:prototype1_lahan/dashboard/part_dashboard/top_card/top_card.dart';
import 'package:prototype1_lahan/inventarisasi/inventarisasi.dart';
import 'package:prototype1_lahan/share/appbarNew.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../share/item.dart';
import 'model/issue_bar.dart';
import 'model/tabel_bidang_card.dart';
import 'model/tabel_issue_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  @override
  Widget build(BuildContext context) {
    // Page Controller
    return Scaffold(

        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //APPBAR
                AppbarNew(title: 'Dashboard'),
                const SizedBox(height: 20,),

                //TOP CARD
                TopCard(),
                const SizedBox(height: 10,),

                //TAB BAR
                KategoriCard(),
                //END TABBAR

                const SizedBox(height: 20,),

                //Tabel Issue
                GestureDetector(
                  onTap: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Inventarisasi()))
                  },
                  child: const SizedBox(
                    // height: 400,
                    child: TabelIssueCard(),
                  ),
                ),

                const SizedBox(height: 20,)

              ],
            ),
          )
        ));
  }
}
