import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IssueCard extends StatefulWidget {
  const IssueCard({Key? key}) : super(key: key);

  @override
  State<IssueCard> createState() => _IssueCardState();
}

class _IssueCardState extends State<IssueCard> {
  late List<IssueData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          width: 300,
          // padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SfCircularChart(
            title:
            ChartTitle(text: 'Issue IPAL'),
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
        )
    );
  }

  List <IssueData> getChartData() {
    final List<IssueData> chartData = [
      IssueData('IPAL', 12),
      IssueData('SPAM', 8),
      IssueData('DPPT Terpadu', 15),
    ];
    return chartData;

  }
}


class IssueData {
  final String jenis;
  final int jumlahIssue;

  IssueData(this.jenis, this.jumlahIssue);
}
