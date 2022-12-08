import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IssueBar extends StatefulWidget {

  const IssueBar({Key? key}) : super(key: key);

  @override
  State<IssueBar> createState() => _IssueBarState();
}

class _IssueBarState extends State<IssueBar> {



  var _chartData;
  var _tooltipBehavior;

  _IssueBarState();

  @override
  void initState() {
    // _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
            child: SfCartesianChart(
              // Initialize category axis
                primaryXAxis: CategoryAxis(),
                series: <StackedBarSeries<SalesData, String>>[
                  StackedBarSeries(
                      dataSource: <SalesData>[
                        SalesData('Jan', 35, 20),
                        SalesData('Feb', 28, 20),
                        SalesData('Mar', 34, 20),
                        SalesData('Apr', 32, 20),
                        SalesData('May', 40, 20)
                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales
                  ),
                  StackedBarSeries(
                      dataSource: <SalesData>[
                        SalesData('Jan', 35, 20),
                        SalesData('Feb', 28, 20),
                        SalesData('Mar', 34, 20),
                        SalesData('Apr', 32, 20),
                        SalesData('May', 40, 20)
                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales2
                  )
                ]
                )
            )
    );
  }



  List<IssueData> data = [
    IssueData(jenis: 0, jumlahIssue: 35.0),
    IssueData(jenis: 1, jumlahIssue: 35.0),
    IssueData(jenis: 2, jumlahIssue: 35.0),
    IssueData(jenis: 3, jumlahIssue: 35.0),
    IssueData(jenis: 4, jumlahIssue: 35.0),
  ];






  // List<IssueData> getChartData() {
  //   var  chartData = <IssueData>[];
  //
  //   var listData = [
  //     {'IPAL': 2000.0, 'label': 'IPAL1'},
  //     {'IPAL': 1500.0, 'label': 'IPAL2'},
  //     {'IPAL': 700.0, 'label': 'IPAL3'}
  //   ];
  //   for(var i = 0; i<listData.length; i++){
  //     chartData.add(IssueData(
  //         jenis:listData[i]['label'].toString(),
  //         jumlahIssue:double.parse(listData[i]['IPAL'].toString())
  //     ));
  //   }
  //
  //   return chartData;
  // }
}
class SalesData {
  SalesData(this.year, this.sales, this.sales2);
  final String year;
  final double sales;
  final double sales2;
}

// class SalesData {
//   final DateTime tanggal;
//   final String label;
//   final double value1;
//   final double value2;
//   final double value3;
//   final double value4;
//   final double value5;
//
//   SalesData(this.tanggal, this.label, this.value1, this.value2, this.value3, this.value4, this.value5);
//
// }


class IssueData {
  final int? jenis;
  final double? jumlahIssue;

  IssueData({this.jenis, this.jumlahIssue});
}
