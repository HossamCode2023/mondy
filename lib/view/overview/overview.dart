import 'package:chil_out/view/overview/widgets/available_shifts_table.dart';
import 'package:chil_out/view/overview/widgets/mailfunctions.dart';
import 'package:chil_out/view/overview/widgets/need_assets92.dart';
import 'package:chil_out/view/overview/widgets/need_assets95.dart';
import 'package:chil_out/view/overview/widgets/revenue_widget/revenue_section_large.dart';
import 'package:chil_out/view/overview/widgets/revenue_widget/revenue_section_small.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controller/controllers.dart';
import '../../helper/responsive_screen.dart';
import '../../widget/custom_text.dart';
import 'widgets/overview_cards_large.dart';
import 'widgets/overview_cards_medium.dart';
import 'widgets/overview_cards_small.dart';


class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
    
      children: [
        Obx(
          () => Row(
            children: [
              //*============== Title page =====================================================
              Container(
                  margin: EdgeInsets.only(top: ResponsiveWidget.isSmallScreen(context) ? 35 : 6, 
                  left: ResponsiveWidget.isSmallScreen(context) ? 60 : 0),
                  child: CustomText(
                    text: menuController.activeItem.value,
                    size: 24,
                    weight: FontWeight.bold,
                  )),
              //*============== Title page =====================================================
            ],
          ),
        ),

        
        Expanded(
          child: ListView(
            children: [
              if (ResponsiveWidget.isLargeScreen(context) || ResponsiveWidget.isMediumScreen(context))
                if (ResponsiveWidget.isCustomSize(context)) const OverviewCardsMediumScreen() else const OverviewCardsLargeScreen()
              else
                const OverviewCardsSmallScreen(),
              if (!ResponsiveWidget.isSmallScreen(context)) const RevenueSectionLarge() else const RevenueSectionSmall(),
              const AvailableShihtsTable(), const NeedAssets92Table(),const NeedAssets95Table(),const MailfunctionsTable(),
            ],
          ),
        ),
      ],
    );
  }
}
