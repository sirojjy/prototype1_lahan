import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IssuePieChart extends StatefulWidget {

  const IssuePieChart({Key? key}) : super(key: key);

  @override
  State<IssuePieChart> createState() => _IssuePieChartState();
}

class _IssuePieChartState extends State<IssuePieChart> {



  var _chartData;
  var _tooltipBehavior;

  _IssuePieChartState();

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

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SfCircularChart(
                palette: const [Color(0x0ff43AA8B), Color(0XFFFFE068)],
                title:
                ChartTitle(text: 'Jumlah Issue/Permasalahan'),
                legend:
                Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
                tooltipBehavior: _tooltipBehavior,
                series: <CircularSeries>[
                  PieSeries<IssueData, String>(
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
      ),
    );
  }

  List<IssueData> getChartData() {
    var  chartData = <IssueData>[];

    var listData = [
      {'data': 65, 'label': 'Open'},
      {'data': 99, 'label': 'Close'},
    ];
    for(var i = 0; i<listData.length; i++){
      chartData.add(IssueData(
          jenis:listData[i]['label'].toString(),
          jumlahIssue:double.parse(listData[i]['data'].toString())
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
