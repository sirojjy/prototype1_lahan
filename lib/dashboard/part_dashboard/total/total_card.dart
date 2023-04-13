import 'package:flutter/material.dart';
import 'package:prototype1_lahan/dashboard/part_dashboard/total/donut_chart.dart';
import 'package:prototype1_lahan/dashboard/part_dashboard/total/total_progres.dart';
import 'donut_chart_bidang.dart';

class TotalCard extends StatelessWidget {
  const TotalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          TitleCardComponent(
            titleCard: 'PROGRES PENGADAAN TANAH',
            color1: Color(0xff2badd9),
            color2: Color(0xff0196C7),
          ),
          SizedBox(height: 10,),
          DonutChart(),
          SizedBox(height: 10,),
          DonutChartBidang(),
        ],
      ),
    );
  }
}
