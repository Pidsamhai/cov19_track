import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cov19_stats/utils/extensions.dart';

class ReportCard extends StatelessWidget {
  final int newCase;
  final int totalCase;
  final Color bgColor;
  final double? width;
  final double? height;
  final String title;
  final Color textColor;

  const ReportCard({
    Key? key,
    required this.newCase,
    required this.totalCase,
    required this.bgColor,
    required this.title,
    required this.textColor,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        color: bgColor,
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: textColor),
              ),
              Text(
                newCase.toCurrency(),
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: textColor),
              ),
              Text(
                "สะสม ${totalCase.toCurrency()}",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
