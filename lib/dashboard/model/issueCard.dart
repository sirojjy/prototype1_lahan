import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IssueCard extends StatefulWidget {
  const IssueCard({Key? key}) : super(key: key);

  @override
  State<IssueCard> createState() => _IssueCardState();
}

class _IssueCardState extends State<IssueCard> {
  // final String judulData1;
  // final String judulData2;
  // final String judulData3;
  //
  // final int data1;
  // final int data2;
  // final int data3;


  late List<IssueData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  _IssueCardState(
      // this.judulData1,
      // this.judulData2,
      // this.judulData3,
      //
      // this.data1,
      // this.data2,
      // this.data3
      );

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          width: 300,
          // padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SfCircularChart(
                title:
                ChartTitle(text: 'Total Luas IPAL'),
                legend:
                Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
                tooltipBehavior: _tooltipBehavior,
                series: <CircularSeries>[
                  DoughnutSeries<IssueData, String>(
                    dataSource: _chartData,
                    xValueMapper: (IssueData data, _) => data.jenis,
                    yValueMapper: (IssueData data, _) => data.jumlahIssue,
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    enableTooltip: true,
                  )
                ],
              )
            ],
          )
        )
    );
  }

  List <IssueData> getChartData() {
    final List<IssueData> chartData = [
      IssueData('IPAL1', 2000),
      IssueData('IPAL2', 1500),
      IssueData('IPAL3', 700),
    ];
    return chartData;

  }
}


class IssueData {
  final String jenis;
  final int jumlahIssue;

  IssueData(this.jenis, this.jumlahIssue);
}
