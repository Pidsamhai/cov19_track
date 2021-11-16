import 'package:cov19_stats/db/database.dart';
import 'package:cov19_stats/ui/widget/search_text_field.dart';
import 'package:cov19_stats/ui/widget/selector_button.dart';
import 'package:cov19_stats/ui/widget/statics_card.dart';
import 'package:cov19_stats/cubit/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cov19_stats/utils/extensions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/foundation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final isDesktop = [
    TargetPlatform.fuchsia,
    TargetPlatform.macOS,
    TargetPlatform.linux,
  ].contains(defaultTargetPlatform);

  late final HomeCubit _bloc;

  List<SelectorBottonItem<String, TimelineFilter>> filterButtons = [
    SelectorBottonItem("Latest 7 Days", TimelineFilter.week),
    SelectorBottonItem("Month", TimelineFilter.month),
    SelectorBottonItem("Year", TimelineFilter.year),
  ];

  late SelectorBottonItem<String, TimelineFilter> _selectedFilter;

  String getDateFormat() {
    if (_selectedFilter.value == TimelineFilter.month) {
      return "dd MMM";
    } else if (_selectedFilter.value == TimelineFilter.year) {
      return "dd MM yy";
    } else {
      return "EEE";
    }
  }

  @override
  void initState() {
    initializeDateFormatting();
    _selectedFilter = filterButtons[0];
    _bloc = context.read<HomeCubit>();
    _bloc.getTimeline(filter: _selectedFilter.value);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  Future<void> fullRefresh() {
    return Future.delayed(const Duration(seconds: 2));
    // return Provider.of<TodayViewModel>(context, listen: false).fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: isDesktop
          ? FloatingActionButton(
              onPressed: () => _bloc.getTimeline(
                filter: _selectedFilter.value,
                forece: true,
              ),
              child: const Icon(Icons.refresh),
            )
          : null,
      body: RefreshIndicator(
        onRefresh: fullRefresh,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            List<TodayEntry> data = state is HomeLoaded ? state.timeline : [];
            TodayEntry? today = data.isEmpty ? null : data.first;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SearcTextField(),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Covid - statics",
                            style: context.theme.textTheme.subtitle2,
                          ),
                          Text(
                            today == null
                                ? ""
                                : "Update at ${today.txnDate.dateFormat(to: "EE dd MMM yyyy")}",
                            style: context.theme.textTheme.subtitle2,
                          ),
                        ],
                      ),
                    ),
                    buildStaticCards(today),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: SelectorBottonWidget<String, TimelineFilter>(
                        selected: _selectedFilter,
                        buttons: filterButtons,
                        onSelected: (s) {
                          setState(() => _selectedFilter = s);
                          _bloc.getTimeline(filter: _selectedFilter.value);
                        },
                      ),
                    ),
                    SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // title: ChartTitle(text: 'Report latest $_reportSelected days'),
                      legend: Legend(
                          isVisible: true, position: LegendPosition.bottom),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<TodayEntry, String>>[
                        ColumnSeries(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(100),
                                topRight: Radius.circular(100)),
                            dataSource: data,
                            xValueMapper: (t, _) =>
                                t.txnDate.dateFormat(to: getDateFormat()),
                            yValueMapper: (t, _) => t.newCase,
                            name: 'New',
                            color: Colors.red.shade600),
                        ColumnSeries(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(100),
                                topRight: Radius.circular(100)),
                            dataSource: data,
                            xValueMapper: (t, _) =>
                                t.txnDate.dateFormat(to: getDateFormat()),
                            yValueMapper: (t, _) => t.newRecovered,
                            name: 'Recovered',
                            color: Colors.green.shade600),
                        ColumnSeries(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(100),
                                topRight: Radius.circular(100)),
                            dataSource: data,
                            xValueMapper: (t, _) =>
                                t.txnDate.dateFormat(to: getDateFormat()),
                            yValueMapper: (t, _) => t.newDeath,
                            name: 'Death',
                            color: Colors.grey.shade600)
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
            );
          },
        ),
      ),
    );
  }
}

Widget loading() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildStaticCards(TodayEntry? today) {
  return Column(
    children: [
      Row(
        children: [
          Flexible(
            child: StaticsCard(
              newCase: today?.newCase,
              totalCase: today?.totalCase,
              prefix: "Total Case ",
            ),
          ),
          Flexible(
            child: StaticsCard(
              newCase: today?.newRecovered,
              totalCase: today?.totalRecovered,
              prefix: "Total Recovred ",
            ),
          ),
        ],
      ),
      StaticsCard(
        newCase: today?.newDeath,
        totalCase: today?.totalDeath,
        prefix: "Total Death ",
      )
    ],
  );
}
