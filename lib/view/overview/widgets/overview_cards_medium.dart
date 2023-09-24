// ignore_for_file: avoid_print

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:chil_out/functions/alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'info_card.dart';

class OverviewCardsMediumScreen extends StatefulWidget {
  const OverviewCardsMediumScreen({super.key});

  @override
  State<OverviewCardsMediumScreen> createState() =>
      _OverviewCardsMediumScreenState();
}

class _OverviewCardsMediumScreenState extends State<OverviewCardsMediumScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('shift').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
          double sum95 = 0;
          double sum92 = 0;
          double sumDiesel = 0;
          for (var document in documents) {
            // Assuming the field you want to sum is called 'amount'
            sum95 += document['gunPetrol95'] ?? 0;
            sum92 += document['gunPetrol92'] ?? 0;
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  InfoCard(
                    title: "Gasoline 95 Total",
                    value: "${sum95.toInt()}",
                    onTap: () {},
                    topColor: Colors.orange,
                  ),
                  SizedBox(
                    width: width / 64,
                  ),
                  InfoCard(
                    title: "Gasoline 92 Total",
                    value: "${sum92.toInt()}",
                    topColor: Colors.lightGreen,
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(
                height: width / 64,
              ),
              Row(
                children: [
                  InfoCard(
                    title: "Diesel Total",
                    value: "${sumDiesel.toInt()}",
                    topColor: Colors.redAccent,
                    onTap: () {},
                  ),
                  SizedBox(
                    width: width / 64,
                  ),
                  InfoCard(
                    title: "Clients",
                    value: "${documents.length}",
                    onTap: () {},
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
