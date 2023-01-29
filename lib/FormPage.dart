import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loginpage/displayProfile.dart';
import 'LoginPage.dart';
import 'main.dart';
import 'LoginPage.dart';

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'blood_convert.dart';
import 'debit_convert.dart';
import 'dob_convert.dart';
import 'gender_convert.dart';
import 'ic_convert.dart';
import 'marital_convert.dart';
import 'phoneNo_convert.dart';
import 'race_covert.dart';
import 'my_encryption.dart';
import 'package:firebase_database/firebase_database.dart';
import 'age_convert.dart';
import 'health_convert.dart';
import 'displayProfile.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(const MaterialApp(
//     home: MyApp(),
//   ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

class FormPage extends StatefulWidget {
  FormPage({super.key});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage>
    with SingleTickerProviderStateMixin {
  // late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(length: 1, vsync: this);
  }

  TextEditingController name = TextEditingController();
  TextEditingController IC = TextEditingController();
  TextEditingController DOB = TextEditingController();
  TextEditingController marital = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController race = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController debit = TextEditingController();
  TextEditingController health = TextEditingController();
  TextEditingController blood = TextEditingController();
  TextEditingController email = TextEditingController();

  var encryptedname,
      encryptedIC,
      maskic,
      encryptedDOB,
      encryptedMS,
      encryptedPhone,
      maskPhone,
      encryptedRace,
      encryptedGender,
      encryptedAge,
      encryptedDebit,
      maskDebit,
      encryptedHS,
      encryptBL,
      encryptEmail;

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User PII Form"),
        // bottom: TabBar(
        //   controller: _tabController,
        //   tabs: [
        //     const Tab(text: 'Isi Form'),
        //     const Tab(text: 'Display Information'),
        //   ],
        // ),
      ),
      //body: TabBarView(
      // controller: _tabController,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                      hintText: "Name", prefixIcon: Icon(Icons.person)),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: IC,
                  decoration: const InputDecoration(
                    hintText: "IC",
                    prefixIcon: Icon(Icons.card_membership),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: DOB,
                  decoration: const InputDecoration(
                      hintText: "DOB", prefixIcon: Icon(Icons.date_range)),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: marital,
                  decoration: const InputDecoration(
                      hintText: "Marital Status", prefixIcon: Icon(Icons.girl)),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: phone,
                  decoration: const InputDecoration(
                      hintText: "PhoneNo",
                      prefixIcon: Icon(Icons.phone_android)),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: race,
                  decoration: const InputDecoration(
                      hintText: "Race", prefixIcon: Icon(Icons.boy)),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: gender,
                  decoration: const InputDecoration(
                      hintText: "Gender", prefixIcon: Icon(Icons.r_mobiledata)),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: age,
                  decoration: const InputDecoration(
                      hintText: "Age",
                      prefixIcon: Icon(Icons.browser_not_supported)),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: debit,
                  decoration: const InputDecoration(
                    hintText: "Debit Card",
                    prefixIcon: Icon(Icons.credit_card),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: health,
                  decoration: const InputDecoration(
                      hintText: "Health History",
                      prefixIcon: Icon(Icons.health_and_safety)),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: blood,
                  decoration: const InputDecoration(
                      hintText: "Type of Blood",
                      prefixIcon: Icon(Icons.bloodtype)),
                ),
                const SizedBox(
                  height: 10.0,
                ),

                //Button
                ElevatedButton(
                  onPressed: () async {
                    encryptedname =
                        MyEncryptionDecryption.encryptAES(name.text);

                    encryptedIC = MyEncryptionDecryption.encryptAES(IC.text);
                    maskic = icmask(IC.text);

                    // encryptedDOB =
                    //     MyEncryptionDecryption.encryptAES(DOB.text);
                    encryptedDOB = getBirthday(IC.text);

                    // encryptedMS =
                    //     MyEncryptionDecryption.encryptAES(marital.text);

                    encryptedMS = maritalStatus(marital.text);

                    encryptedPhone =
                        MyEncryptionDecryption.encryptAES(phone.text);
                    maskPhone = maskPhoneString(phone.text);

                    // encryptedRace =
                    //     MyEncryptionDecryption.encryptAES(race.text);

                    encryptedRace = getRaceCode(race.text);

                    // encryptedGender =
                    //     MyEncryptionDecryption.encryptAES(gender.text);
                    encryptedGender = getGenderCode(gender.text);

                    // encryptedAge =
                    //     MyEncryptionDecryption.encryptAES(age.text);

                    encryptedAge = convertString(age.text);

                    encryptedDebit =
                        MyEncryptionDecryption.encryptAES(debit.text);
                    maskDebit = maskString(debit.text);

                    // encryptedHS =
                    //     MyEncryptionDecryption.encryptAES(health.text);

                    encryptedHS = checkDisease(health.text);
                    encryptBL = getBloodTypeCode(blood.text);
                    encryptEmail =
                        MyEncryptionDecryption.encryptAES(email.text);

                    // Convert the Encrypted objects to base64-encoded strings
                    String encryptednameBase64 =
                        base64Encode(encryptedname.bytes);
                    String encryptedICBase64 = base64Encode(encryptedIC.bytes);
                    // String encryptedDOBBase64 =
                    //     base64Encode(encryptedDOB.bytes);
                    // String encryptedMSBase64 =
                    //     base64Encode(encryptedMS.bytes);
                    String encryptedPhoneBase64 =
                        base64Encode(encryptedPhone.bytes);
                    // String encryptedRaceBase64 =
                    //     base64Encode(encryptedRace.bytes);
                    // String encryptedGenderBase64 =
                    //     base64Encode(encryptedGender.bytes);
                    // String encryptedAgeBase64 =
                    //     base64Encode(encryptedAge.bytes);
                    String encryptedDebitBase64 =
                        base64Encode(encryptedDebit.bytes);
                    // String encryptedHSBase64 =
                    //     base64Encode(encryptedHS.bytes);
                    String encryptedEmailBase64 =
                        base64Encode(encryptEmail.bytes);
                    Map<String, dynamic> data = {
                      "Name": encryptednameBase64,
                      "IC": encryptedICBase64,
                      "Email": encryptedEmailBase64,
                      "DOB": encryptedDOB,
                      "Marital Status": encryptedMS,
                      "PhoneNo": encryptedPhoneBase64,
                      "Race": encryptedRace,
                      "Gender": encryptedGender,
                      "Age": encryptedAge,
                      "Debit Card": encryptedDebitBase64,
                      "Health History": encryptedHS,
                      "Type of Blood": encryptBL
                    };

                    Map<String, dynamic> raw = {
                      "Name": name.text,
                      "IC": maskic,
                      "Email": email.text,
                      "DOB": encryptedDOB,
                      "Marital Status": marital.text,
                      "PhoneNo": maskPhone,
                      "Race": race.text,
                      "Gender": gender.text,
                      "Age": age.text,
                      "Debit Card": maskDebit,
                      "Health History": health.text,
                      "Type of Blood": blood.text,
                      "uid": auth.currentUser!.uid
                    };

                    Map<String, dynamic> admin = {
                      "Name": name.text,
                      "IC": IC.text,
                      "Email": email.text,
                      "DOB": DOB.text,
                      "Marital Status": marital.text,
                      "PhoneNo": phone.text,
                      "Race": race.text,
                      "Gender": gender.text,
                      "Age": age.text,
                      "Debit Card": debit.text,
                      "Health History": health.text,
                      "Type of Blood": blood.text,
                      //"uid": auth.currentUser!.uid
                    };
                    final databaseReference = FirebaseFirestore.instance
                        .collection('encrypted_text')
                        .doc(FirebaseAuth.instance.currentUser!.uid);
                    await databaseReference.set(data);

                    final databaseReference2 =
                        FirebaseFirestore.instance.collection('raw').doc();
                    await databaseReference2.set(raw);

                    final databaseReference3 =
                        FirebaseFirestore.instance.collection('admin').doc();
                    await databaseReference3.set(admin);

                    // FirebaseFirestore.instance.collection("Encrypted").add(data);
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => displayProfile()),
                    );
                  },
                  child: const Text("Submit"),
                )
              ],
            ),
          ),
        ),
      ),
    ); //)
  }
}
