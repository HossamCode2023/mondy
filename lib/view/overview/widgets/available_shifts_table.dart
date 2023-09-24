import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:chil_out/functions/alert.dart';
import 'package:chil_out/theme/app_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../widget/custom_text.dart';

/// Example without datasource
class AvailableShihtsTable extends StatelessWidget {
  const AvailableShihtsTable({super.key});

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
                text: 'Shifts Conclusion',
                color: AppTheme.lightGrey,
                weight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(
            height: (56 * 7) + 40,
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('shift').orderBy('gunPetrolTotalLiters',descending: true).snapshots(),
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
                  minWidth: 1500,
                  columns: const [
                    DataColumn2(
                        label: Text("Station Name"), size: ColumnSize.S),
                    DataColumn2(label: Text("Manager"), size: ColumnSize.S),
                    DataColumn2(label: Text("Date/Time"), size: ColumnSize.S),
                    DataColumn2(label: Center(child: Text("Gasoline 95")), size: ColumnSize.S),
                    DataColumn2(label: Text("Gasoline 92"), size: ColumnSize.S),
                    DataColumn2(
                        label: Text("Gasoline Total"), size: ColumnSize.S),
                    DataColumn2(label: Text('Support'), size: ColumnSize.S),
                    DataColumn2(label: Text('Cheif Name'), size: ColumnSize.S),
                    DataColumn2(label: Text('Workers'), size: ColumnSize.S),
                  ],
                  rows: List<DataRow>.generate(
                    documents.length,
                    (index) => DataRow(
                      cells: [
                        DataCell(CustomText(
                            text: documents[index]['stationName'].toString())),
                        DataCell(CustomText(
                            text: documents[index]['manager'].toString())),
                        DataCell(CustomText(
                            text: documents[index]['dateTime'].toString())),
                        DataCell(Center(
                          child: CustomText(
                              text: documents[index]['gunPetrol95'].toString()),
                        )),
                        DataCell(CustomText(
                            text: documents[index]['gunPetrol92'].toString())),
                        DataCell(CustomText(
                            text: documents[index]['gunPetrolTotalLiters']
                                .toString())),
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
        ],
      ),
    );
  }
}
