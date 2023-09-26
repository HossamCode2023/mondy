import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:chil_out/functions/alert.dart';
import 'package:chil_out/theme/app_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../widget/custom_text.dart';
import '../../../widget/elevatedButtonUtils.dart';

/// Example without datasource
class Clientstable extends StatelessWidget {
  const Clientstable({super.key});

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
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
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
              columnSpacing: 10,
              dataRowHeight: 60,
              headingRowHeight: 40,
              horizontalMargin: 10,
              minWidth: 2000,
              columns: const [
                DataColumn2(label: Text("Station Name"), size: ColumnSize.L),
                DataColumn2(label: Text("Date/Time"), size: ColumnSize.L),
                DataColumn2(label: Text("Email"), size: ColumnSize.L),
                DataColumn2(label: Text("Password"), size: ColumnSize.L),
                DataColumn2(label: Text("Manager"), size: ColumnSize.L),
                DataColumn2(label: Text("Manager Phone"), size: ColumnSize.L),
                DataColumn2(label: Text("Deputy Name"), size: ColumnSize.L),
                DataColumn2(label: Text("Deputy Phone"), size: ColumnSize.L),
                DataColumn2(label: Text("Title Jop"), size: ColumnSize.L),
                DataColumn2(label: Text("Manager Now"), size: ColumnSize.L),
                DataColumn2(label: Text("Phone Now"), size: ColumnSize.L),
                DataColumn2(label: Text("Delete Account"), size: ColumnSize.L),
                
              ],
              rows: List<DataRow>.generate(
                documents.length,
                (index) => DataRow(
                  cells: [
                    DataCell(CustomText(text: documents[index]['stationName'].toString())),
                    DataCell(CustomText(text: documents[index]['dateTime'].toString())),
                    DataCell(CustomText(text: documents[index]['email'].toString())),
                    DataCell(CustomText(text: documents[index]['password'].toString())),
                    DataCell(CustomText(text: documents[index]['managerName'].toString())),
                    DataCell(CustomText(text: documents[index]['managerPhone'].toString())),
                    DataCell(CustomText(text: documents[index]['deputyName'].toString())),
                    DataCell(CustomText(text: documents[index]['deputyPhone'].toString())),
                    DataCell(CustomText(text: documents[index]['titleJop'].toString())),
                    DataCell(CustomText(text: documents[index]['managerNow'].toString())),
                    DataCell(CustomText(text: documents[index]['phoneNow'].toString())),
                    DataCell(ElevatedButtonUtils(
                      onPressed: (){},
                      text: 'Delete',
                      color: AppTheme.dark,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      decoration: TextDecoration.none,
                      paddingHerizontal: 10,
                      paddingVertical: 10,
                      primary: AppTheme.lightPrimaryColor,
                    )),
                    
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
