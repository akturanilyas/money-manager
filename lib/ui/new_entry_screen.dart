import 'package:bloctest/widget/labeled_switch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewEntryPage extends StatefulWidget {
  static const path = "/new";
  const NewEntryPage({Key? key}) : super(key: key);

  @override
  _NewEntryPageState createState() => _NewEntryPageState();
}

class _NewEntryPageState extends State<NewEntryPage> {
  final TextEditingController nameController = TextEditingController();
  bool _isSelected = true;

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
    final phoneSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('New Entry'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          runSpacing: 50,
          alignment: WrapAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                icon: Icon(Icons.text_format),
                labelText: 'Describe a name',
                // labelStyle: theme.textTheme.headline1),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: nameController,
              decoration: InputDecoration(
                icon: Icon(Icons.attach_money),
                labelText: 'Enter to cost',
                // labelStyle: theme.textTheme.headline1),
              ),
            ),
            LabeledSwitch(
              label: 'Status',
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: _isSelected,
              onChanged: (bool newValue) {
                setState(() {
                  _isSelected = newValue;
                });
              },
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                minimumSize: MaterialStateProperty.all(
                  Size(
                    phoneSize.height * .1,
                    phoneSize.width * .1,
                  ),
                ),
              ),
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                // getDataFromFirestore();
                setDataToFirestore();
              },
            )
          ],
        ),
      ),
    );
  }
}
