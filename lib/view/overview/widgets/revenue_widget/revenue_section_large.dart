import 'package:chil_out/theme/app_theme.dart';
import 'package:chil_out/view/overview/widgets/revenue_widget/revenue_info.dart';
import 'package:flutter/material.dart';


import '../../../../widget/custom_text.dart';
import '../charts_widget/bar_chart.dart';

class RevenueSectionLarge extends StatelessWidget {
  const RevenueSectionLarge({super.key});


  @override
  Widget build(BuildContext context) {
    return  Container(
                padding: const EdgeInsets.all(24),
                margin: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 6),
                        color: AppTheme.lightGrey.withOpacity(.1),
                        blurRadius: 12)
                  ],
                  border: Border.all(color: AppTheme.lightGrey, width: .5),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                           CustomText(
                            text: "Revenue Chart",
                            size: 20,
                            weight: FontWeight.bold,
                            color: AppTheme.lightGrey,
                          ),
                          const SizedBox(
                              width: 600,
                              height: 200,
                              child: BarChartSample3()),
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 120,
                      color: AppTheme.lightGrey,
                    ),
                     const Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              RevenueInfo(
                                title: "Toda's revenue",
                                amount: "230",
                              ),
                              RevenueInfo(
                                title: "Last 7 days",
                                amount: "1,100",
                              ),
                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            children: [
                              RevenueInfo(
                                title: "Last 30 days",
                                amount: "3,230",
                              ),
                              RevenueInfo(
                                title: "Last 12 months",
                                amount: "11,300",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
  }
}