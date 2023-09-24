import 'package:chil_out/theme/app_theme.dart';
import 'package:flutter/material.dart';

class RevenueInfo extends StatelessWidget {
  final String? title;
  final String? amount;

  const RevenueInfo({Key? key, this.title, this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: "$title \n\n",
                style:  TextStyle(color: AppTheme.lightGrey, fontSize: 16)),
            TextSpan(
                text: "\$ $amount",
                style:  TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: AppTheme.dark)),
          ])),
    );
  }
}
