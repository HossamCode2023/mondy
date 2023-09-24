import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:chil_out/functions/alert.dart';
import 'package:chil_out/theme/app_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../widget/custom_text.dart';

/// Example without datasource
class NeedAssets92Table extends StatelessWidget {
  const NeedAssets92Table({super.key});

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              CustomText(
                text: 'Need Gasoline 92',
                color: AppTheme.lightGrey,
                weight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(
            height: (56 * 4) + 40,
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('assets').orderBy('blanks92',descending: true ).endAt([124000]).snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
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
                  columnSpacing: 10,
                  dataRowHeight: 60,
                  headingRowHeight: 40,
                  horizontalMargin: 10,
                  minWidth: 600,
                  columns: const [
                    DataColumn2(
                        label: Text("Station Name"), size: ColumnSize.S),
                    DataColumn2(label: Center(child: Text("Manager")), size: ColumnSize.L),
                    DataColumn2(label: Center(child: Text("Date")), size: ColumnSize.S),
                    DataColumn2(label: Center(child: Text("Time")), size: ColumnSize.S),
                    DataColumn2(label: Center(child: Text("Gasoline 92")), size: ColumnSize.S),
                    
                  ],
                  rows: List<DataRow>.generate(
                    documents.length,
                    (index) => DataRow(
                      cells: [
                        DataCell(CustomText(
                            text: documents[index]['stationName'].toString())),
                        DataCell(Center(
                          child: CustomText(
                              text: documents[index]['manager'].toString()),
                        )),
                        DataCell(Center(
                          child: CustomText(
                              text: documents[index]['date'].toString()),
                        )),
                        DataCell(Center(
                          child: CustomText(
                              text: documents[index]['time'].toString()),
                        )),
                        DataCell(Center(
                          child: CustomText(
                              text: documents[index]['assets92'].toString()),
                        )),
                      
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
