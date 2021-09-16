import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class NewEntryPage extends StatefulWidget {
  static const path = "/new";
  const NewEntryPage({Key? key}) : super(key: key);

  @override
  _NewEntryPageState createState() => _NewEntryPageState();
}

class _NewEntryPageState extends State<NewEntryPage> {
  getDataFromFirestore() async {
    final firestoreInstance = FirebaseFirestore.instance;
    final result = await firestoreInstance
        .collection("users")
        .doc("1")
        .collection('transfers')
        .get()
        .then(
      (querySnapshot) {
        querySnapshot.docs.forEach(
          (result) {
            print(result.data());
          },
        );
      },
    );
  }

  setDataToFirestore() {
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection("users").doc('1').collection("transfers").add(
      {
        "cost": 23,
        "name": "new spend",
        "type": false,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Entry'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CupertinoSwitch(
            value: true,
            onChanged: (index) {},
          ),
          Switch(
            value: true,
            onChanged: (i) {},
          ),
          FlutterSwitch(
            activeText: "All Good. Negative.",
            inactiveText: "Under Quarantine.",
            value: true,
            valueFontSize: 10.0,
            width: 110,
            borderRadius: 30.0,
            showOnOff: true,
            onToggle: (val) {
              // setState(() {
              //   status6 = val;
              // });
            },
          ),
          TextButton(
              onPressed: () {
                // getDataFromFirestore();
                setDataToFirestore();
              },
              child: Text("print"))
        ],
      ),
    );
  }
}
