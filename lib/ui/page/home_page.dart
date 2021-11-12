import 'package:cov19_stats/db/database.dart';
import 'package:cov19_stats/ui/widget/search_text_field.dart';
import 'package:cov19_stats/ui/widget/selector_button.dart';
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
  List<SelectorBottonItem<String, int>> filterButtons = [
    SelectorBottonItem("Week", 7),
    SelectorBottonItem("Month", 30),
    SelectorBottonItem("Year", 7),
  ];

  late SelectorBottonItem<String, int> selected;

  @override
  void initState() {
    selected = filterButtons[0];
    BlocProvider.of<HomeCubit>(context).getTimeline(limit: selected.value);
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
                  return loading();
                } else if (state is HomeLoaded) {
                  return Row(
                    children: [
                      StaticsCard(
                        newCase: state.timeline.first.newCase ?? 0,
                        totalCase: state.timeline.first.totalCase ?? 0,
                      ),
                      StaticsCard(
                        newCase: state.timeline.first.newRecovered ?? 0,
                        totalCase: state.timeline.first.totalCase ?? 0,
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text("error"),
                  );
                }
              }),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: SelectorBottonWidget<String, int>(
                  selected: selected,
                  buttons: filterButtons,
                  onSelected: (s) {
                    setState(() => selected = s);
                    BlocProvider.of<HomeCubit>(context)
                        .getTimeline(limit: selected.value);
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

class StaticsCard extends StatelessWidget {
  final int newCase;
  final int totalCase;

  const StaticsCard({
    Key? key,
    required this.newCase,
    required this.totalCase,
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
                  newCase.toCurrency(),
                  style: context.theme.textTheme.headline4,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 20),
                Text(
                  totalCase.toCurrency(),
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
