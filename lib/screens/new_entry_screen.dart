import 'dart:io';

import 'package:bloctest/bloc/firestore/firestore_bloc.dart';
import 'package:bloctest/constants/theme.dart';
import 'package:bloctest/widget/labeled_switch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

  late File _image;
  final picker = ImagePicker();
  bool _isImageSelected = false;
  bool _isSelected = true;

  @override
  Widget build(BuildContext context) {
    final phoneSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeConstants.primaryColor,
        title: Text('New Entry'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: _fields(phoneSize, context)),
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
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: _isSelected ? Colors.blueAccent : Colors.red,
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    minVerticalPadding: 20,
                    // TODO! add there if else block and if true show picture
                    leading:
                        Icon(Icons.photo_size_select_actual_rounded, size: 70),
                    title: Text(nameController.text,
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    subtitle: Text(valueController.value.text,
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.white),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: null,
                      content: Container(
                        height: 100,
                        child: Column(
                          children: [
                            Container(
                                width: 100,
                                child: Image(
                                  image: AssetImage("assets/images/food.png"),
                                )),
                            Container(
                                width: phoneSize.width * 0.8,
                                child: Text(
                                  "Success",
                                  style: TextStyle(
                                    fontFamily: 'HelveticaNueue',
                                    fontWeight: FontWeight.bold,
                                    // fontSize: 16.sp,
                                    // height: 1.5.h,
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                          ],
                        ),
                      ),
                    ),
                  );
                  // getImage();
                },
                child: Icon(Icons.image),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(ThemeConstants.primaryColor),
                ),
              ),
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
            ),
          ],
        ));
  }

  Future<bool> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      return true;
    } else {
      print('No image selected.');
      return false;
    }
  }
}
