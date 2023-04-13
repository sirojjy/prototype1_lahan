import 'package:flutter/material.dart';
import 'package:prototype1_lahan/dashboard/part_dashboard/kategori_card/kategori_card.dart';
import 'package:prototype1_lahan/dashboard/part_dashboard/kategori/segment_card.dart';
import 'package:prototype1_lahan/dashboard/part_dashboard/total/issue_pie_chart.dart';
import 'package:prototype1_lahan/dashboard/part_dashboard/total/progres_tanah.dart';
import 'package:prototype1_lahan/dashboard/part_dashboard/total/rincian_bidang.dart';
import 'package:prototype1_lahan/dashboard/part_dashboard/total/total_bidang.dart';
import 'package:prototype1_lahan/dashboard/part_dashboard/total/total_card.dart';
import 'package:prototype1_lahan/dashboard/part_dashboard/total/total_eligible.dart';
import 'package:prototype1_lahan/dashboard/part_dashboard/total/total_kekurangan_berkas.dart';
import 'package:prototype1_lahan/dashboard/part_dashboard/total/total_luas_bidang.dart';
import 'package:prototype1_lahan/dashboard/part_dashboard/total/total_nilai.dart';
import 'package:prototype1_lahan/inventarisasi/inventarisasi.dart';
import 'package:prototype1_lahan/share/appbarNew.dart';
import '../share/item.dart';
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
                ///TOTAL
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Center(child: Text('Monitoring Progres Lahan IKN', style: TextStyle(fontSize: 24), textAlign: TextAlign.center,),),
                ),
                TotalCard(),
                const SizedBox(height: 10,),

                //TOP CARD
                SegmentCard(),
                const SizedBox(height: 10,),
                RicianBidang(),
                const SizedBox(height: 10,),
                IssuePieChart(),
                const SizedBox(height: 10,),
                TotalBidang(),
                const SizedBox(height: 10,),
                TotalLuasBidang(),
                const SizedBox(height: 10,),
                TotalNilai(),const
                SizedBox(height: 10,),
                TotalEligible(),
                SizedBox(height: 10,),
                TotalKekuranganBerkas(),

                //TAB BAR
                // KategoriCard(),

                //END TABBAR

                // const SizedBox(height: 20,),


                // //Tabel Issue
                // GestureDetector(
                //   onTap: () => {
                //     Navigator.push(context, MaterialPageRoute(builder: (context) => const Inventarisasi()))
                //   },
                //   child: const SizedBox(
                //     // height: 400,
                //     child: TabelIssueCard(),
                //   ),
                // ),

                const SizedBox(height: 20,)

              ],
            ),
          )
        ));
  }
}
