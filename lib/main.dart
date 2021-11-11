import 'package:cov19_stats/di/injector.dart';
import 'package:cov19_stats/ui/page/timeline_page.dart';
import 'package:cov19_stats/ui/page/home_page.dart';
import 'package:cov19_stats/ui/widget/profile_app_bar.dart';
import 'package:cov19_stats/view_model/time_line_view_model.dart';
import 'package:cov19_stats/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  configureInjection();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getit<HomeViewModel>()),
        ChangeNotifierProvider(create: (_) => getit<TimelineViewModel>()),
      ],
      child: const MyApp(),
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
        ));
  }
}
