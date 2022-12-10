import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BidangPeChart extends StatefulWidget {

  const BidangPeChart({Key? key}) : super(key: key);

  @override
  State<BidangPeChart> createState() => _BidangPeChartState();
}

class _BidangPeChartState extends State<BidangPeChart> {



  var _chartData;
  var _tooltipBehavior;

  _BidangPeChartState();

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
          // padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SfCircularChart(
                title:
                ChartTitle(text: 'Persentase Bidang Eligible & Not Eligible'),
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
        )
    );
  }

  List<IssueData> getChartData() {
    var  chartData = <IssueData>[];

    var listData = [
      {'data': 20, 'label': 'Eligible'},
      {'data': 80, 'label': 'Not Eligible'},
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
