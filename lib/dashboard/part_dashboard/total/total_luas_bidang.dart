import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TotalLuasBidang extends StatefulWidget {
  const TotalLuasBidang({Key? key}) : super(key: key);

  @override
  State<TotalLuasBidang> createState() => _TotalLuasBidangState();
}

class _TotalLuasBidangState extends State<TotalLuasBidang> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<SalesData> getChartData() {
      var chartData = <SalesData>[];
      var listData = [
        {'year': 'Pembayaran', 'sales': 60.51, 'sales2': 313.13},
        // {'year': 'Yuridis', 'sales': 0, 'sales2': 0},
        {'year': 'Usulan SPP', 'sales': 60.51, 'sales2': 313.13},
        {'year': 'Validasi', 'sales': 60.96, 'sales2': 312.68},
        {'year': 'Musyawarah', 'sales': 62.65, 'sales2': 310.99},
        {'year': 'Apraisal', 'sales': 62.59, 'sales2': 311.05},
        {'year': 'Inventarisasi', 'sales': 191.95, 'sales2': 181.69},
        {'year': 'Kebutuhan', 'sales': 373.64, 'sales2': 0},
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
              title: ChartTitle(text: 'Total Luas Bidang (Ha)'),
              legend: Legend(
                  isVisible: true,
                  position: LegendPosition.bottom
              ),
              palette: const <Color>[
                Color(0xFF31CEA2),
                Color(0xFFFF9C33),
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
