import 'package:cov19_stats/db/database.dart';
import 'package:cov19_stats/view_model/time_line_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:provider/provider.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({Key? key}) : super(key: key);

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  final List<int> _reportRange = [7, 15, 30, 0];
  int _reportSelected = 7;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (!Provider.of<TimelineViewModel>(context, listen: false).inited) {
        _refreshIndicatorKey.currentState?.show();
      }
    });
    super.initState();
  }

  Future<void> fullRefresh() {
    return Provider.of<TimelineViewModel>(context, listen: false).fetch();
  }

  @override
  Widget build(BuildContext context) {
    List<TimelineEntry> timelineData =
        context.watch<TimelineViewModel>().result ?? [];

    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: fullRefresh,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            children: [
              DropdownButton(
                value: _reportSelected,
                onChanged: (int? v) {
                  setState(() => _reportSelected = v ?? 7);
                },
                items: _reportRange.map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value == 0 ? "All" : value.toString()),
                  );
                }).toList(),
              ),
              SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                title: ChartTitle(text: 'Report latest $_reportSelected days'),
                legend: Legend(isVisible: true),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<TimelineEntry, String>>[
                  LineSeries<TimelineEntry, String>(
                    dataSource: _reportSelected == 0 ? timelineData : timelineData.take(_reportSelected).toList(),
                    xValueMapper: (TimelineEntry t, _) => t.txnDate,
                    yValueMapper: (TimelineEntry t, _) => t.newCase,
                    name: 'Case',
                    color: const Color(0xFFFF0000),
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                  ),
                  LineSeries<TimelineEntry, String>(
                    dataSource: timelineData,
                    xValueMapper: (TimelineEntry t, _) => t.txnDate,
                    yValueMapper: (TimelineEntry t, _) => t.newRecovered,
                    name: 'Recovered',
                    color: const Color(0xFF00FF00),
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                  ),
                  LineSeries<TimelineEntry, String>(
                    dataSource: timelineData,
                    xValueMapper: (TimelineEntry t, _) => t.txnDate,
                    yValueMapper: (TimelineEntry t, _) => t.newDeath,
                    name: 'Death',
                    color: const Color(0xFFFF00FF),
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
