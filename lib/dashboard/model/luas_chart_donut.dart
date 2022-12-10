import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LuasChartDonut extends StatefulWidget {

  const LuasChartDonut({Key? key}) : super(key: key);

  @override
  State<LuasChartDonut> createState() => _LuasChartDonutState();
}

class _LuasChartDonutState extends State<LuasChartDonut> {



  var _chartData;
  var _tooltipBehavior;

  _LuasChartDonutState();

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          // width: 300,
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

  List<IssueData> getChartData() {
    var  chartData = <IssueData>[];

    var listData = [
      {'IPAL': 2000, 'label': 'IPAL1'},
      {'IPAL': 1500, 'label': 'IPAL2'},
      {'IPAL': 700, 'label': 'IPAL3'}
    ];
    for(var i = 0; i<listData.length; i++){
      chartData.add(IssueData(
          jenis:listData[i]['label'].toString(),
          jumlahIssue:double.parse(listData[i]['IPAL'].toString())
      ));
    }

    return chartData;
  }
}


class IssueData {
  final String? jenis;
  final double? jumlahIssue;

  IssueData({this.jenis, this.jumlahIssue});
}
