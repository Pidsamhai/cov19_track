import 'package:cov19_stats/db/database.dart';
import 'package:cov19_stats/repository/ddc_repository.dart';
import 'package:cov19_stats/services/ddc_api_client.dart';
import 'package:cov19_stats/ui/page/timeline_page.dart';
import 'package:cov19_stats/ui/page/home_page.dart';
import 'package:cov19_stats/ui/widget/profile_app_bar.dart';
import 'package:cov19_stats/cubit/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  final AppDatabase database = openConnection();
  final DDCApiClient ddcApiClient = DDCApiClient();

  runApp(
    RepositoryProvider<DDCRepository>(
      create: (context) => DDCRepositoryImpl(ddcApiClient.dio, database),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create: (BuildContext context) => HomeCubit(context.read<DDCRepository>()),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selected = 0;
  String? subtitle;

  static final List<Widget> pages = [const HomePage(), const TimelinePage()];

  void selectedPage(int index) {
    setState(() => _selected = index);
  }

  void setSubtitle(String? subtitle) {
    setState(() => this.subtitle = subtitle);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: ProfileAppBar(),
        bottomNavigationBar: BottomNavigationBar(
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.language),
              label: "Language",
            )
          ],
          showUnselectedLabels: false,
          currentIndex: _selected,
          onTap: selectedPage,
        ),
        body: pages[_selected],
      ),
    );
  }
}
