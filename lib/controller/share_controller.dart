
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:chil_out/functions/alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class ShareController extends GetxController {
    static ShareController instance = Get.find();
      TextEditingController assets95Controller = TextEditingController();
      TextEditingController assets92Controller = TextEditingController();
      TextEditingController malfunctionsController = TextEditingController();
      TextEditingController sales95Controller = TextEditingController();
      TextEditingController sales92Controller = TextEditingController();
      TextEditingController numOfWorkerController = TextEditingController();
      TextEditingController saleController = TextEditingController();
      TextEditingController winController = TextEditingController();
      TextEditingController comController = TextEditingController();
      TextEditingController petrol92Controller = TextEditingController();
      TextEditingController petrol95Controller = TextEditingController();

      //*=============== car Product ===================
      TextEditingController carCode = TextEditingController();
      TextEditingController numCarRequest = TextEditingController();
      TextEditingController carDriverName = TextEditingController();
      TextEditingController normal95 = TextEditingController();
      TextEditingController const95 = TextEditingController();
      TextEditingController normal92 = TextEditingController();
      TextEditingController const92 = TextEditingController();
      TextEditingController storehouse = TextEditingController();

      RxInt blanks95 = 0.obs;
      RxInt blanks92 = 0.obs;

  CollectionReference assets = FirebaseFirestore.instance.collection('assets');
    String date = Jiffy.now().format(pattern: 'd/M/yyyy' ).toString();
    String time = Jiffy.now().format(pattern: ' h:mm a').toString();


void calBlanks(){
  int assets95 = int.tryParse(assets95Controller.text) ?? 0;
  int assets92 = int.tryParse(assets92Controller.text) ?? 0;
  blanks95.value = 135000 -assets95 ;
  blanks92.value = 135000 -assets92 ;
  update();
}

//*==== Function to delete data to Firebass ==========================================

  Future<void> deleteAssets(BuildContext context, String docid) {
    return FirebaseFirestore.instance
        .collection('assets')
        .doc(docid)
        .delete()
        .then((value) {
//! Alert =========================
      alert(
          context: context,
          title: 'Success',
          message: 'Your data is delete',
          contentType: ContentType.success);
    }).catchError((error) {
      //! Alert =========================
      alert(
          context: context,
          title: 'Error!',
          message: '$error',
          contentType: ContentType.failure);
    });
  }

  //*==== Function to add data to Firebass ==========================================

  Future<void> addAssets(BuildContext context) {
    // Call the Assets CollectionReference to add a assets
    return assets.add({
      'stationName':stationName,
      'manager':  manager,
      'assets95':assets95Controller.text.toString(),
      'assets92':assets92Controller.text.toString(),
      'blanks95':blanks95.value,
      'blanks92':blanks92.value,
      'malfunctionsController':malfunctionsController.text.toString(),
      'date': date,
      'time': time,
      'id': FirebaseAuth.instance.currentUser!
          .uid, //* ========= to save for user ===============
    }).then((value) {
      //! Alert =========================
      alert(
          context: context,
          title: 'Success!',
          message: 'Your data saved ',
          contentType: ContentType.success);
          // storeOldValue();
          update();
    }).catchError((error) {
      //! Alert =========================
      alert(
          context: context,
          title: 'Error!',
          message: '$error',
          contentType: ContentType.failure);
    });
  }

//*==== Function to set data to Firebass =====================================
  Future<void> setAssets(BuildContext context) {
    // Call the user's CollectionReference to add a new user
    return assets.doc().set({
      'stationName':stationName,
      'manager':  manager,
      'assets95':assets95Controller.text.toString(),
      'assets92':assets92Controller.text.toString(),
      'blanks95':blanks95.value.toString(),
      'blanks92':blanks92.value.toString(),
      'malfunctionsController':malfunctionsController.text.toString(),
      'date': date,
      'time': time,
     
    }) //* ========= to save for user ===============
        .then((value) {
      //! Alert =========================
      alert(
          context: context,
          title: 'Success!',
          message: 'Your data saved ',
          contentType: ContentType.success);
    }).catchError((error) {
      //! Alert =========================
      alert(
          context: context,
          title: 'Error!',
          message: '$error',
          contentType: ContentType.failure);
    });
  }

   bool isLoading = true;

 
String stationName = '';
String manager = '';
  getStationAndmanagerName() async{
      List<QueryDocumentSnapshot> data = [];

          QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    data.addAll(querySnapshot.docs);
    isLoading = false;
    stationName = data[0]['stationName'];
    manager = data[0]['managerNow'];
    update();
        
  }
@override
  void onInit() {
   getStationAndmanagerName();
   stationName ='';
   manager ='';
    super.onInit();
  }
}