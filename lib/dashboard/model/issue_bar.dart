import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IssueBar extends StatefulWidget {

  const IssueBar({Key? key}) : super(key: key);

  @override
  State<IssueBar> createState() => _IssueBarState();
}

class _IssueBarState extends State<IssueBar> {

  _IssueBarState();

  @override
  void initState() {
    // _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          height: 200,
            child: SfCartesianChart(
              // Initialize category axis
                primaryXAxis: CategoryAxis(),
                series: <StackedBarSeries<SalesData, String>>[
                  StackedBarSeries(
                      dataSource: <SalesData>[
                        SalesData('IPAL 1', 35, 20),
                        SalesData('IPAL 2', 28, 20),
                        SalesData('IPAL 3', 34, 20),
                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales
                  ),
                  StackedBarSeries(
                      dataSource: <SalesData>[
                        SalesData('IPAL 1', 35, 20),
                        SalesData('IPAL 2', 28, 20),
                        SalesData('IPAL 3', 34, 20),
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
  ];
}
class SalesData {
  SalesData(this.year, this.sales, this.sales2);
  final String year;
  final double sales;
  final double sales2;
}

class IssueData {
  final int? jenis;
  final double? jumlahIssue;

  IssueData({this.jenis, this.jumlahIssue});
}
