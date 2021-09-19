import 'package:bloctest/bloc/firestore/firestore_bloc.dart';
import 'package:bloctest/constants/theme.dart';
import 'package:bloctest/widget/labeled_switch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class NewEntryPage extends StatefulWidget {
  static const path = "/new";
  const NewEntryPage({Key? key}) : super(key: key);

  @override
  _NewEntryPageState createState() => _NewEntryPageState();
}

class _NewEntryPageState extends State<NewEntryPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController valueController = TextEditingController();

  bool _isSelected = true;

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
        backgroundColor: ThemeConstants.primaryColor,
        title: Text('New Entry'),
        centerTitle: true,
      ),
      body: _fields(phoneSize, context),
    );
  }

  Padding _fields(Size phoneSize, BuildContext context) {
    return Padding(
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
            controller: valueController,
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
              backgroundColor:
                  MaterialStateProperty.all(ThemeConstants.primaryColor),
              minimumSize: MaterialStateProperty.all(
                Size(
                  phoneSize.height * .15,
                  phoneSize.width * .12,
                ),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            child: Text(
              'Save',
              style: TextStyle(color: ThemeConstants.selectedItemColor),
            ),
            onPressed: () {
              context.read<FirestoreBloc>().add(CreatedButtonTapped(
                  created: DateTime.now(),
                  // TODO! Refactor there
                  imageUrl:
                      'https://media.gettyimages.com/photos/blue-mosque-in-istanbul-picture-id160193420?s=612x612',
                  name: nameController.text,
                  status: _isSelected,
                  value: double.parse(valueController.text)));
            },
          )
        ],
      ),
    );
  }
}
