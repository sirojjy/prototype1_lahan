import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TotalBidang extends StatefulWidget {
  const TotalBidang({Key? key}) : super(key: key);

  @override
  State<TotalBidang> createState() => _TotalBidangState();
}

class _TotalBidangState extends State<TotalBidang> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<SalesData> getChartData() {
      var chartData = <SalesData>[];
      var listData = [
        {'year': 'Pembayaran', 'sales': 92, 'sales2': 425},
        // {'year': 'Yuridis', 'sales': 0, 'sales2': 0},
        {'year': 'Usulan SPP', 'sales': 92, 'sales2': 425},
        {'year': 'Validasi', 'sales': 96, 'sales2': 421},
        {'year': 'Musyawarah', 'sales': 109, 'sales2': 409},
        {'year': 'Apraisal', 'sales': 109, 'sales2': 408},
        {'year': 'Inventarisasi', 'sales': 392, 'sales2': 125},
        {'year': 'Kebutuhan', 'sales': 517, 'sales2': 0},
      ];
      for (var i = 0; i < listData.length; i++) {
        chartData.add(SalesData(
          year: listData[i]['year'].toString(),
          sales: double.parse(listData[i]['sales'].toString()),
          sales2: double.parse(listData[i]['sales2'].toString()),
        ));
        // nilai: double.parse(listData[i]['data'].toString())));
      }

      return chartData;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
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
          height: 350,
          child: SfCartesianChart(
            // Initialize category axis
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(),
              title: ChartTitle(text: 'Total Jumlah Bidang'),
              legend: Legend(
                  isVisible: true,
                  position: LegendPosition.bottom
              ),
              palette: const <Color>[
                Color(0xFF199BED),
                Color(0xFFFF6954),
              ],
              series: <StackedBarSeries<SalesData, String>>[
                StackedBarSeries(
                    name: 'Sudah Realisasi',
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    dataSource: getChartData(),
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales),
                StackedBarSeries(
                    name: 'Belum Realisasi',
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    dataSource: getChartData(),
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales2)
              ])),
    );
  }
}

class SalesData {
  SalesData({required this.year, this.sales, this.sales2});
  final String year;
  final double? sales;
  final double? sales2;
}
