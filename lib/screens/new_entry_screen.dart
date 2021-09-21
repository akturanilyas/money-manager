import 'package:bloctest/bloc/firestore/firestore_bloc.dart';
import 'package:bloctest/constants/image_constants.dart';
import 'package:bloctest/constants/theme.dart';
import 'package:bloctest/widget/labeled_switch.dart';
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
  int selectedImage = 0;
  List<AssetImage> images = [
    ImageConstants.money,
    ImageConstants.home,
    ImageConstants.food,
    ImageConstants.pet,
    ImageConstants.shoe
  ];
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
                  leading: Image(
                    image: images[selectedImage],
                    color: ThemeConstants.selectedItemColor,
                    width: MediaQuery.of(context).size.width * .2,
                    height: MediaQuery.of(context).size.height * .1,
                  ),
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
          Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedImage = 0;
                      });
                    },
                    child: Image(
                      image: ImageConstants.money,
                      color: selectedImage == 0
                          ? ThemeConstants.greenAccent
                          : ThemeConstants.selectedItemColor,
                      width: MediaQuery.of(context).size.width * .2,
                      height: MediaQuery.of(context).size.height * .1,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedImage = 1;
                      });
                    },
                    child: Image(
                      image: ImageConstants.home,
                      color: selectedImage == 1
                          ? ThemeConstants.greenAccent
                          : ThemeConstants.selectedItemColor,
                      width: MediaQuery.of(context).size.width * .2,
                      height: MediaQuery.of(context).size.height * .1,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedImage = 2;
                      });
                    },
                    child: Image(
                      image: ImageConstants.food,
                      color: selectedImage == 2
                          ? ThemeConstants.greenAccent
                          : ThemeConstants.selectedItemColor,
                      width: MediaQuery.of(context).size.width * .2,
                      height: MediaQuery.of(context).size.height * .1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedImage = 3;
                      });
                    },
                    child: Image(
                      image: ImageConstants.pet,
                      color: selectedImage == 3
                          ? ThemeConstants.greenAccent
                          : ThemeConstants.selectedItemColor,
                      width: MediaQuery.of(context).size.width * .2,
                      height: MediaQuery.of(context).size.height * .1,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedImage = 4;
                      });
                    },
                    child: Image(
                      image: ImageConstants.shoe,
                      color: selectedImage == 4
                          ? ThemeConstants.greenAccent
                          : ThemeConstants.selectedItemColor,
                      width: MediaQuery.of(context).size.width * .2,
                      height: MediaQuery.of(context).size.height * .1,
                    ),
                  ),
                ],
              ),
            ],
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
                  image: selectedImage,
                  name: nameController.text,
                  status: _isSelected,
                  value: double.parse(valueController.text)));
            },
          ),
        ],
      ),
    );
  }
}
