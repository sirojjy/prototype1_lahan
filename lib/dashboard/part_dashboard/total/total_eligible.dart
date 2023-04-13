import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TotalEligible extends StatefulWidget {

  const TotalEligible({Key? key}) : super(key: key);

  @override
  State<TotalEligible> createState() => _TotalEligibleState();
}

class _TotalEligibleState extends State<TotalEligible> {



  var _chartData;
  var _tooltipBehavior;

  _TotalEligibleState();

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
                palette: const [Color(0xff59cfff),
                  Color(0xfffc6c59)],
                title:
                ChartTitle(text: 'Total Bidang Eligible & Not Eligible'),
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
      {'data': 112, 'label': 'Bidang Eligible'},
      {'data': 280, 'label': 'Bidang Not Eligible'},
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
