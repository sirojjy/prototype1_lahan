import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class KelengkapanBidang extends StatefulWidget {

  const KelengkapanBidang({Key? key}) : super(key: key);

  @override
  State<KelengkapanBidang> createState() => _KelengkapanBidangState();
}

class _KelengkapanBidangState extends State<KelengkapanBidang> {



  var _chartData;
  var _tooltipBehavior;

  _KelengkapanBidangState();

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
          height: 300,
            child: SfCartesianChart(
              // Initialize category axis
                primaryXAxis: CategoryAxis(),
                title: ChartTitle(text: 'Kelengkapan Dokumen'),
                legend: Legend(overflowMode: LegendItemOverflowMode.wrap),
                palette: <Color>[
                  Color(0xFF59C1BD),
                  Color(0xFFF49D1A),
                ],
                series: <StackedBar100Series<SalesData, String>>[
                  StackedBar100Series(
                      dataSource: <SalesData>[
                        SalesData('Penlok', 35, 20),
                        SalesData('Daftar \n Nominatif', 28, 20),
                        SalesData('Identitas', 34, 20),
                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales
                  ),
                  StackedBar100Series(
                      dataSource: <SalesData>[
                        SalesData('Penlok', 35, 20),
                        SalesData('Daftar \n Nominatif', 28, 20),
                        SalesData('Identitas', 34, 20),
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
