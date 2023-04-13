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
  var _tooltipBehavior;
  _LuasChartDonutState();

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    BlocProvider.of<KategoriCardBloc>(context).add(ViewKategoriCard());
    getPref();
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

          print('Data Luas IPAL1: ${state.dataKategoriCard[0].luasIpal1}');

          List<IpalLuasData> dataKategoriCard() {
            var  chartData = <IpalLuasData>[];
            var listData = [
              {'IPAL': state.dataKategoriCard[0].luasIpal1, 'label': 'IPAL1'},
              {'IPAL': state.dataKategoriCard[0].luasIpal2, 'label': 'IPAL2'},
              {'IPAL': state.dataKategoriCard[0].luasIpal3, 'label': 'IPAL3'}
            ];
            for(var i = 0; i<listData.length; i++){
              chartData.add(IpalLuasData(
                  jenis:listData[i]['label'].toString(),
                  jumlahIssue:double.parse(listData[i]['IPAL'].toString())
              ));
            }
            return chartData;
          }
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
                          DoughnutSeries<IpalLuasData, String>(
                            dataSource: dataKategoriCard(),
                            xValueMapper: (IpalLuasData data, _) => data.jenis,
                            yValueMapper: (IpalLuasData data, _) => data.jumlahIssue,
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


}

class IpalLuasData {
  final String? jenis;
  final double? jumlahIssue;
  IpalLuasData({this.jenis, this.jumlahIssue});
}

