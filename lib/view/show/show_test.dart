import 'package:chil_out/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowTest extends StatelessWidget {
  const ShowTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إختبار للقيم'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              ShowWidget(
                gunElec: homeController.gun1Elec,
                gunMech: homeController.gun1Mech,
                title: 'مسدس 1',
                gunNewMech: homeController.gun1NewMechController,
                gunOldMech: homeController.gun1OldMechController,
                gunNewElec: homeController.gun1NewElecController,
                gunOldElec: homeController.gun1OldElecController,
                gasolineGauges: homeController.gasolineGauges,
                gun: homeController.gun1,
                gunDif: homeController.gun1Dif,
              ),
              ShowWidget(
                gunElec: homeController.gun2Elec,
                gunMech: homeController.gun2Mech,
                title: 'مسدس 2',
                gunNewMech: homeController.gun2NewMechController,
                gunOldMech: homeController.gun2OldMechController,
                gunNewElec: homeController.gun2NewElecController,
                gunOldElec: homeController.gun2OldElecController,
                gasolineGauges: homeController.gasolineGauges,
                gun: homeController.gun2,
                gunDif: homeController.gun2Dif,
              ),
              ShowWidget(
                gunElec: homeController.gun3Elec,
                gunMech: homeController.gun3Mech,
                title: 'مسدس 3',
                gunNewMech: homeController.gun3NewMechController,
                gunOldMech: homeController.gun3OldMechController,
                gunNewElec: homeController.gun3NewElecController,
                gunOldElec: homeController.gun3OldElecController,
                gasolineGauges: homeController.gasolineGauges,
                gun: homeController.gun3,
                gunDif: homeController.gun3Dif,
              ),
              ShowWidget(
                gunElec: homeController.gun4Elec,
                gunMech: homeController.gun4Mech,
                title: 'مسدس 4',
                gunNewMech: homeController.gun4NewMechController,
                gunOldMech: homeController.gun4OldMechController,
                gunNewElec: homeController.gun4NewElecController,
                gunOldElec: homeController.gun4OldElecController,
                gasolineGauges: homeController.gasolineGauges,
                gun: homeController.gun4,
                gunDif: homeController.gun4Dif,
              ),
              ShowWidget(
                gunElec: homeController.gun5Elec,
                gunMech: homeController.gun5Mech,
                title: 'مسدس 5',
                gunNewMech: homeController.gun5NewMechController,
                gunOldMech: homeController.gun5OldMechController,
                gunNewElec: homeController.gun5NewElecController,
                gunOldElec: homeController.gun5OldElecController,
                gasolineGauges: homeController.gasolineGauges,
                gun: homeController.gun5,
                gunDif: homeController.gun5Dif,
              ),
              ShowWidget(
                gunElec: homeController.gun6Elec,
                gunMech: homeController.gun6Mech,
                title: 'مسدس 6',
                gunNewMech: homeController.gun6NewMechController,
                gunOldMech: homeController.gun6OldMechController,
                gunNewElec: homeController.gun6NewElecController,
                gunOldElec: homeController.gun6OldElecController,
                gasolineGauges: homeController.gasolineGauges,
                gun: homeController.gun6,
                gunDif: homeController.gun6Dif,
              ),
              ShowWidget(
                gunElec: homeController.gun7Elec,
                gunMech: homeController.gun7Mech,
                title: 'مسدس 7',
                gunNewMech: homeController.gun7NewMechController,
                gunOldMech: homeController.gun7OldMechController,
                gunNewElec: homeController.gun7NewElecController,
                gunOldElec: homeController.gun7OldElecController,
                gasolineGauges: homeController.gasolineGauges,
                gun: homeController.gun7,
                gunDif: homeController.gun7Dif,
              ),
              ShowWidget(
                gunElec: homeController.gun8Elec,
                gunMech: homeController.gun8Mech,
                title: 'مسدس 8',
                gunNewMech: homeController.gun8NewMechController,
                gunOldMech: homeController.gun8OldMechController,
                gunNewElec: homeController.gun8NewElecController,
                gunOldElec: homeController.gun8OldElecController,
                gasolineGauges: homeController.gasolineGauges,
                gun: homeController.gun8,
                gunDif: homeController.gun8Dif,
              ),
              ShowWidget(
                gunElec: homeController.gun9Elec,
                gunMech: homeController.gun9Mech,
                title: 'مسدس 9',
                gunNewMech: homeController.gun9NewMechController,
                gunOldMech: homeController.gun9OldMechController,
                gunNewElec: homeController.gun9NewElecController,
                gunOldElec: homeController.gun9OldElecController,
                gasolineGauges: homeController.gasolineGauges,
                gun: homeController.gun9,
                gunDif: homeController.gun9Dif,
              ),
              ShowWidget(
                gunElec: homeController.gun10Elec,
                gunMech: homeController.gun10Mech,
                title: 'مسدس 10',
                gunNewMech: homeController.gun10NewMechController,
                gunOldMech: homeController.gun10OldMechController,
                gunNewElec: homeController.gun10NewElecController,
                gunOldElec: homeController.gun10OldElecController,
                gasolineGauges: homeController.gasolineGauges,
                gun: homeController.gun10,
                gunDif: homeController.gun10Dif,
              ),
              ShowWidget(
                gunElec: homeController.gun11Elec,
                gunMech: homeController.gun11Mech,
                title: 'مسدس 11',
                gunNewMech: homeController.gun11NewMechController,
                gunOldMech: homeController.gun11OldMechController,
                gunNewElec: homeController.gun11NewElecController,
                gunOldElec: homeController.gun11OldElecController,
                gasolineGauges: homeController.gasolineGauges,
                gun: homeController.gun11,
                gunDif: homeController.gun11Dif,
              ),
              ShowWidget(
                gunElec: homeController.gun12Elec,
                gunMech: homeController.gun12Mech,
                title: 'مسدس 12',
                gunNewMech: homeController.gun12NewMechController,
                gunOldMech: homeController.gun12OldMechController,
                gunNewElec: homeController.gun12NewElecController,
                gunOldElec: homeController.gun12OldElecController,
                gasolineGauges: homeController.gasolineGauges,
                gun: homeController.gun12,
                gunDif: homeController.gun12Dif,
              ),
              ShowWidget(
                gunElec: homeController.gun13Elec,
                gunMech: homeController.gun13Mech,
                title: 'مسدس 13',
                gunNewMech: homeController.gun13NewMechController,
                gunOldMech: homeController.gun13OldMechController,
                gunNewElec: homeController.gun13NewElecController,
                gunOldElec: homeController.gun13OldElecController,
                gasolineGauges: homeController.gasolineGauges,
                gun: homeController.gun13,
                gunDif: homeController.gun13Dif,
              ),
              ShowWidget(
                gunElec: homeController.gun14Elec,
                gunMech: homeController.gun14Mech,
                title: 'مسدس 14',
                gunNewMech: homeController.gun14NewMechController,
                gunOldMech: homeController.gun14OldMechController,
                gunNewElec: homeController.gun14NewElecController,
                gunOldElec: homeController.gun14OldElecController,
                gasolineGauges: homeController.gasolineGauges,
                gun: homeController.gun14,
                gunDif: homeController.gun14Dif,
              ),
              ShowWidget(
                gunElec: homeController.gun15Elec,
                gunMech: homeController.gun15Mech,
                title: 'مسدس 15',
                gunNewMech: homeController.gun15NewMechController,
                gunOldMech: homeController.gun15OldMechController,
                gunNewElec: homeController.gun15NewElecController,
                gunOldElec: homeController.gun15OldElecController,
                gasolineGauges: homeController.gasolineGauges,
                gun: homeController.gun15,
                gunDif: homeController.gun15Dif,
              ),
              ShowWidget(
                gunElec: homeController.gun16Elec,
                gunMech: homeController.gun16Mech,
                title: 'مسدس 16',
                gunNewMech: homeController.gun16NewMechController,
                gunOldMech: homeController.gun16OldMechController,
                gunNewElec: homeController.gun16NewElecController,
                gunOldElec: homeController.gun16OldElecController,
                gasolineGauges: homeController.gasolineGauges,
                gun: homeController.gun16,
                gunDif: homeController.gun16Dif,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShowWidget extends StatelessWidget {
  final String title;
  final TextEditingController gunNewMech;
  final TextEditingController gunNewElec;
  final TextEditingController gunOldMech;
  final TextEditingController gunOldElec;
  final RxInt gunElec, gunMech, gunDif, gun;
  final int gasolineGauges;
  const ShowWidget({
    super.key,
    required this.title,
    required this.gunElec,
    required this.gunMech,
    required this.gunNewMech,
    required this.gunOldMech,
    required this.gunNewElec,
    required this.gunOldElec,
    required this.gasolineGauges,
    required this.gunDif,
    required this.gun,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Center(
        child: SizedBox(
          
          height: 360,
          width: 350,
          child: Column(
            children: [
              Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: const Color(0xffff8900),
                ),
                child: Center(
                    child: Text(
                  title,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )),
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 145,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.grey.shade300,
                    ),
                    child: const Center(
                        child: Text(
                      'إلكترونى',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.grey.shade300,
                    ),
                    height: 40,
                    width: 145,
                    child: const Center(
                        child: Text(
                      'ميكانيكى',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.grey.shade300,
                    ),
                    child: const Center(
                        child: Text(
                      'الطريقة',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 145,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Center(
                        child: Text(
                      gunNewElec.text,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                    height: 40,
                    width: 145,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Center(
                        child: Text(
                      gunNewMech.text,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.yellowAccent,
                    ),
                    child: const Center(
                        child: Text(
                      'نهاية',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 145,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Center(
                        child: Text(
                      gunOldElec.text,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                    height: 40,
                    width: 145,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Center(
                        child: Text(
                      gunOldMech.text,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.yellowAccent,
                    ),
                    child: const Center(
                        child: Text(
                      'بداية',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 290,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Center(
                        child: Text(
                      '$gasolineGauges',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.yellowAccent,
                    ),
                    child: const Center(
                        child: Text(
                      'عيارات',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 145,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Center(
                        child: Text(
                      '$gunElec',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                    height: 40,
                    width: 145,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Center(
                        child: Text(
                      '$gunMech',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.yellowAccent,
                    ),
                    child: const Center(
                        child: Text(
                      'المنصرف',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 290,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Obx(() => Center(
                            child: Text(
                          '$gun',
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold, color:Colors.red),
                        ))),
                  ),
                  Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.yellowAccent,
                    ),
                    child: const Center(
                        child: Text(
                      'الفعلى',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 290,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: gunDif > -3 && gunDif < 3 ? Colors.yellow : Colors.red,
                    ),
                    child: Center(
                        child: Text(
                      '$gunDif',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(),
                       color: Colors.yellowAccent,
                    ),
                    child: const Center(
                        child: Text(
                      'الفروق',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
