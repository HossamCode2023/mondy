// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously, unnecessary_cast

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:chil_out/view/auth/sign_in_screen.dart';
import 'package:chil_out/view/setting/users/setting_users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';

import '../../functions/alert.dart';
// import 'package:get/get.dart';


class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 20),
            Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/user_image.png'),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  FirebaseAuth.instance.currentUser == null ?
                  const Text(
                    'Sign in your account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  
                  ): StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(),
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
         
          return  Text(
              documents[0]['managerNow'].toString(),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
            );
        },
      ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 50),
          buildAccountCard(title: 'Profile Info', onClick: () {Get.to(()=>const SignInScreen());}),
          buildAccountCard(title: 'Notifications', onClick: () {}),
          buildAccountCard(title: 'Settings', onClick: () {Get.to(()=>const SettingUsers());}),
          buildAccountCard(title: 'About Us', onClick: () {}),
          buildAccountCard(title: 'Terms & Servies', onClick: () {}),
          buildAccountCard(
            title:'Sign Out', 
            onClick: ()async {
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();
              await FirebaseAuth.instance.signOut();
              //! Alert =========================
              alert(
               
                 context: context,title: 'Cood bay!',
               message: 'See you later!',contentType: ContentType.success);
               
              setState(() {
             
                Get.toNamed('/welcome');
              });
              
              
            }),
        ],
      ),
    );
  }

  Widget buildAccountCard({required String title, required Function onClick}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GestureDetector(
        onTap: () {
          onClick();
        },
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  blurRadius: 7,
                  spreadRadius: 0.1,
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(Icons.keyboard_arrow_right_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
