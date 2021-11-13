import 'package:cov19_stats/db/database.dart';
import 'package:cov19_stats/ui/widget/search_text_field.dart';
import 'package:cov19_stats/ui/widget/selector_button.dart';
import 'package:cov19_stats/ui/widget/statics_card.dart';
import 'package:cov19_stats/view_model/home/cubit/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cov19_stats/utils/extensions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SelectorBottonItem<String, TimelineFilter>> filterButtons = [
    SelectorBottonItem("Week", TimelineFilter.week),
    SelectorBottonItem("Month", TimelineFilter.month),
    SelectorBottonItem("Year", TimelineFilter.year),
  ];

  late SelectorBottonItem<String, TimelineFilter> selected;

  @override
  void initState() {
    selected = filterButtons[0];
    BlocProvider.of<HomeCubit>(context).getTimeline(filter: selected.value);
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<HomeCubit>(context).close();
    super.dispose();
  }

  Future<void> fullRefresh() {
    return Future.delayed(const Duration(seconds: 2));
    // return Provider.of<TodayViewModel>(context, listen: false).fetch();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: fullRefresh,
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
              BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
                if (state is HomeLoading) {
                  return buildStaticCards(null);
                } else if (state is HomeLoaded) {
                  return buildStaticCards(state.timeline);
                } else {
                  return buildStaticCards(null);
                }
              }),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: SelectorBottonWidget<String, TimelineFilter>(
                  selected: selected,
                  buttons: filterButtons,
                  onSelected: (s) {
                    setState(() => selected = s);
                    BlocProvider.of<HomeCubit>(context)
                        .getTimeline(filter: selected.value);
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () =>
                    BlocProvider.of<HomeCubit>(context).getTimeline(),
                child: const Text("Refresh"),
              ),
              BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
                print(state);
                List<TodayEntry> data =
                    state is HomeLoaded ? state.timeline : [];
                return SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // title: ChartTitle(text: 'Report latest $_reportSelected days'),
                  legend:
                      Legend(isVisible: true, position: LegendPosition.bottom),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<TodayEntry, String>>[
                    ColumnSeries(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100)),
                      dataSource: data,
                      xValueMapper: (t, _) => t.txnDate,
                      yValueMapper: (t, _) => t.newCase,
                      name: 'New',
                    ),
                    ColumnSeries(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100)),
                      dataSource: data,
                      xValueMapper: (t, _) => t.txnDate,
                      yValueMapper: (t, _) => t.newRecovered,
                      name: 'Recovered',
                    )
                  ],
                );
              }),
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

Widget loading() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildStaticCards(List<TodayEntry>? timeline) {
  return Row(
    children: [
      StaticsCard(
        newCase: timeline?.first.newCase,
        totalCase: timeline?.first.totalCase,
      ),
      StaticsCard(
        newCase: timeline?.first.newRecovered,
        totalCase: timeline?.first.totalCase,
      ),
    ],
  );
}
