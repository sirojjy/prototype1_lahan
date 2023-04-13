import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TotalNilai extends StatefulWidget {
  const TotalNilai({Key? key}) : super(key: key);

  @override
  State<TotalNilai> createState() => _TotalNilaiState();
}

class _TotalNilaiState extends State<TotalNilai> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<SalesData> getChartData() {
      var chartData = <SalesData>[];
      var listData = [
        {'year': 'Validasi', 'sales': 127565350231, 'sales2': 0},
        {'year': 'Musyawarah', 'sales': 127565350231, 'sales2': 1103395926},
        {'year': 'Apraisal', 'sales': 128374752909, 'sales2': 863155872},
        {'year': 'Inventarisasi', 'sales': 131672063274, 'sales2': 0},
        {'year': 'Kebutuhan', 'sales': 131672063274, 'sales2': 0},
      ];
      for (var i = 0; i < listData.length; i++) {
        chartData.add(SalesData(
          year: listData[i]['year'].toString(),
          sales: double.parse(listData[i]['sales'].toString()),
          sales2: double.parse(listData[i]['sales2'].toString()),
        ));
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
              title: ChartTitle(text: 'Total Nilai Ganti Kerugian'),
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
