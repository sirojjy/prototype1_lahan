import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prototype1_lahan/dashboard/part_dashboard/kategori_card/kategori_card_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LuasChartDonut extends StatefulWidget {
  const LuasChartDonut({Key? key}) : super(key: key);
  @override
  State<LuasChartDonut> createState() => _LuasChartDonutState();
}

class _LuasChartDonutState extends State<LuasChartDonut> {
  SharedPreferences? pref;
  var _chartData;
  var _tooltipBehavior;
  _LuasChartDonutState();

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    BlocProvider.of<KategoriCardBloc>(context).add(ViewKategoriCard());
    super.initState();
  }
  void getPref() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KategoriCardBloc, KategoriCardState>(
        bloc: BlocProvider.of<KategoriCardBloc>(context)..add(ViewKategoriCard()),
        builder: (context, state){
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SfCircularChart(
                        palette: const [
                          Colors.blueAccent,
                          Colors.yellow,
                          Colors.green
                        ],
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
    );
  }

  List<IssueData> getChartData() {
    var  chartData = <IssueData>[];
    var listData = [
      {'IPAL': 212966, 'label': 'IPAL1'},
      {'IPAL': 115711, 'label': 'IPAL2'},
      {'IPAL': 0, 'label': 'IPAL3'}
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
