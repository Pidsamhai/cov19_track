import 'dart:math';

import 'package:cov19_stats/db/database.dart';
import 'package:cov19_stats/ui/widget/search_text_field.dart';
import 'package:cov19_stats/view_model/today_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cov19_stats/utils/extensions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({Key? key}) : super(key: key);
  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (!Provider.of<TodayViewModel>(context, listen: false).inited) {
        _refreshIndicatorKey.currentState?.show();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> fullRefresh() {
    return Future.delayed(const Duration(seconds: 2));
    // return Provider.of<TodayViewModel>(context, listen: false).fetch();
  }

  TimelineEntry get fake => TimelineEntry(
      txnDate: "2020-${Random().nextInt(12)}-01",
      newCase: Random().nextInt(999),
      totalCase: Random().nextInt(999),
      newCaseExcludeabroad: Random().nextInt(999),
      totalCaseExcludeabroad: Random().nextInt(999),
      newDeath: Random().nextInt(999),
      totalDeath: Random().nextInt(999),
      newRecovered: Random().nextInt(999),
      totalRecovered: Random().nextInt(999),
      updateDate: "2020-${Random().nextInt(12)}-01");

  List<TimelineEntry> get fakeData =>
      Iterable<int>.generate(10).toList().map((e) => fake).toList();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => Future.delayed(const Duration(seconds: 10)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearcTextField(),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Covid - statics",
                style: context.theme.textTheme.subtitle2,
              ),
              Row(
                children: const [
                  StaticsCard(),
                  StaticsCard(),
                ],
              ),
              SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // title: ChartTitle(text: 'Report latest $_reportSelected days'),
                legend:
                    Legend(isVisible: true, position: LegendPosition.bottom),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<TimelineEntry, String>>[
                  ColumnSeries(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100)),
                    dataSource: fakeData,
                    xValueMapper: (t, _) => t.txnDate,
                    yValueMapper: (t, _) => t.newCase,
                    name: 'New',
                  ),
                  ColumnSeries(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100)),
                    dataSource: fakeData,
                    xValueMapper: (t, _) => t.txnDate,
                    yValueMapper: (t, _) => t.newRecovered,
                    name: 'Recovered',
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "Covid - statics",
                    style: context.theme.textTheme.subtitle2,
                  ),
                  const Spacer(),
                  Text(
                    "View all >",
                    style: context.theme.textTheme.subtitle1,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StaticsCard extends StatelessWidget {
  const StaticsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        width: double.maxFinite,
        height: 120,
        child: Card(
          elevation: 0,
          color: const Color(0xFFEEEEEE),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "19999999999",
                  style: context.theme.textTheme.headline4,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 20),
                Text(
                  "19999999999",
                  style: context.theme.textTheme.subtitle1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
