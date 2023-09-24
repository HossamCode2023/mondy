// ignore_for_file: avoid_print, unused_local_variable


import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../functions/alert.dart';
import 'info_card_small.dart';

class OverviewCardsSmallScreen extends StatefulWidget {
  const OverviewCardsSmallScreen({super.key});

  @override
  State<OverviewCardsSmallScreen> createState() => _OverviewCardsSmallScreenState();
}

class _OverviewCardsSmallScreenState extends State<OverviewCardsSmallScreen> {
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 400,
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
      return  Center(
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
        children: [
          InfoCardSmall(
            title: "Gasoline 95 Total",
            value: "${sum95.toInt()}",
            onTap: () {},
            isActive: true,
          ),
          
          SizedBox(
            height: width / 64,
          ),
          InfoCardSmall(
            title: "Gasoline 92 Total",
            value: "${sum92.toInt()}",
            onTap: () {},
          ),
          SizedBox(
            height: width / 64,
          ),
          InfoCardSmall(
            title: "Diesel Total",
            value: "0",
            onTap: () {},
          ),
          SizedBox(
            height: width / 64,
          ),
          InfoCardSmall(
            title: "Clients",
            value: "${documents.length}",
            onTap: () {},
          ),
        ],
      );
  },
), 
    );
  }


  
}
