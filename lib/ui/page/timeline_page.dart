import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({Key? key}) : super(key: key);

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  @override
  void initState() {
    super.initState();
  }

  Future fullRefresh() => Future.delayed(const Duration(seconds: 3));

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: fullRefresh,
      child: const SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Center(
            child: Text("Not implement yet"),
          ),
        ),
      ),
    );
  }
}
