import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:chil_out/functions/alert.dart';
import 'package:chil_out/theme/app_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../widget/custom_text.dart';

/// Example without datasource
class ShiftsTable extends StatelessWidget {
  const ShiftsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppTheme.active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: AppTheme.lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 30),
      child: SizedBox(
        height: (60 * 7) + 40,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('shift').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              alert(
                  context: context,
                  title: 'Error!',
                  message: '${snapshot.error}',
                  contentType: ContentType.failure);
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Lottie.asset(
                'assets/lottie/animation_lmbpkfm2.json',
              ));
            }
            final List<DocumentSnapshot> documents = snapshot.data!.docs;

            return DataTable2(
              showCheckboxColumn: true,
              showBottomBorder: true,
              columnSpacing: 12,
              dataRowHeight: 60,
              headingRowHeight: 40,
              horizontalMargin: 12,
              minWidth: 2400,
              columns: const [
                DataColumn2(label: Text("Station Name"), size: ColumnSize.L),
                DataColumn2(label: Text("Manager"), size: ColumnSize.L),
                DataColumn2(label: Text("Date/Time"), size: ColumnSize.L),
                DataColumn2(label: Text("Gasoline 95"), size: ColumnSize.L),
                DataColumn2(label: Text("petrol95Value"), size: ColumnSize.L),
                DataColumn2(label: Text("Gasoline 92"), size: ColumnSize.L),
                DataColumn2(label: Text("petrol92Value"), size: ColumnSize.L),
                DataColumn2(label: Text("Gasoline Total"), size: ColumnSize.L),
                DataColumn2(label: Text("Gasoline Sales"), size: ColumnSize.L),
                DataColumn2(label: Text("visa Total"), size: ColumnSize.L),
                DataColumn2(label: Text("Workers Owed"), size: ColumnSize.L),
                DataColumn2(label: Text("Workers Company"), size: ColumnSize.L),
                DataColumn2(label: Text("percent_30"), size: ColumnSize.L),
                DataColumn2(label: Center(child: Text('Bank'))),
                DataColumn2(label: Center(child: Text('Office'))),
                DataColumn(label: Center(child: Text('Company Total'))), 
                DataColumn(label: Center(child: Text('Cheif Required'))),
                DataColumn(label: Center(child: Text('Support'))),
                DataColumn(label: Text('Cheif Name')),
                DataColumn(label: Text('Workers')),
              ],
              rows: List<DataRow>.generate(
                documents.length,
                (index) => DataRow(
                  cells: [
                    DataCell(CustomText(text: documents[index]['stationName'].toString())),
                    DataCell(CustomText(text: documents[index]['manager'].toString())),
                    DataCell(CustomText(text: documents[index]['dateTime'].toString())),
                    DataCell(CustomText(text: documents[index]['gunPetrol95'].toString())),
                    DataCell(CustomText(text: documents[index]['petrol95Value'].toString())),
                    DataCell(CustomText(text: documents[index]['gunPetrol92'].toString())),
                    DataCell(CustomText(text: documents[index]['petrol92Value'].toString())),
                    DataCell(CustomText(text: documents[index]['gunPetrolTotalLiters'].toString())),
                    DataCell(CustomText(text: documents[index]['gunPetrolTotalPrice'].toString())),
                    DataCell(CustomText(text: documents[index]['visaTotal'].toString())),
                    DataCell(CustomText(
                        text: documents[index]['workersOwed'].toString())),
                    DataCell(CustomText(
                        text: documents[index]['companyWorkers'].toString())),
                    DataCell(CustomText(
                        text: documents[index]['percent_30'].toString())),
                    DataCell(
                        CustomText(text: documents[index]['bank'].toString())),
                    DataCell(CustomText(
                        text: documents[index]['office'].toString())),
                    DataCell(CustomText(
                        text: documents[index]['companyTotal'].toString())),
                    DataCell(CustomText(
                        text: documents[index]['shiftCheif'].toString())),
                    DataCell(CustomText(
                        text: documents[index]['support'].toString())),
                    DataCell(CustomText(
                        text: documents[index]['nameShif'].toString())),
                    DataCell(CustomText(
                        text: documents[index]['numWorkers'].toString())),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
