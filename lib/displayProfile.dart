import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:loginpage/LoginPage.dart';
import 'package:loginpage/main.dart';
import 'my_encryption.dart';

String getText(documentSnapshot) {
  return documentSnapshot['Name'];
}

class displayProfile extends StatelessWidget {
  var encryptedText;
  final CollectionReference docID =
      FirebaseFirestore.instance.collection('encrypted_text');
  final user = FirebaseAuth.instance; //.currentUser!;

  displayProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile Demo'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('raw')
            .where("uid", isEqualTo: user.currentUser!.uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Text("Loading... noo");
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: ((context, index) {
              final DocumentSnapshot documentSnapshot =
                  snapshot.data!.docs[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        // MyEncryptionDecryption.decryptAES(
                        //     "tPSyHcc6g4OnQqgemI4qjQ=="),
                        //documentSnapshot['Name'],
                        //text("d"),
                        'Name                     :      ${documentSnapshot['Name']}',
                        //getText(documentSnapshot),

                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'IC Number             :      ${documentSnapshot['IC']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Email                      :      ${documentSnapshot['Email']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'DOB                        :      ${documentSnapshot['DOB']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Marital Status       :      ${documentSnapshot['Marital Status']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Phone Number     :      ${documentSnapshot['PhoneNo']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Race                       :       ${documentSnapshot['Race']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Gender                   :      ${documentSnapshot['Gender']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Age                         :       ${documentSnapshot['Age']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Debit Card             :      ${documentSnapshot['Debit Card']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Health History      :      ${documentSnapshot['Health History']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Type of Blood       :      ${documentSnapshot['Type of Blood']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          width: 150,
                          child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size.fromHeight(50),
                              ),
                              icon: Icon(Icons.arrow_back, size: 32),
                              label: const Text(
                                'Logout',
                                style: TextStyle(fontSize: 24),
                              ),
                              onPressed: () async {
                                //FirebaseAuth.instance.signOut(),
                                await FirebaseAuth.instance.signOut();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainPage(),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
