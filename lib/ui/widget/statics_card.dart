import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cov19_stats/utils/extensions.dart';

class StaticsCard extends StatelessWidget {
  final int? newCase;
  final int? totalCase;
  final String prefix;

  const StaticsCard({
    Key? key,
    this.newCase,
    this.totalCase,
    this.prefix = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                newCase == null ? "-" : "+${newCase!.toCurrency()}",
                style: context.theme.textTheme.headline4,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 20),
              Text(
                totalCase == null ? "-" : prefix + totalCase!.toCurrency(),
                style: context.theme.textTheme.subtitle1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
