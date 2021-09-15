import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({Key? key}) : super(key: key);

  @override
  _AnalysisScreenState createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext builderContext, int index) {
        return Container(
          width: 200,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.blueAccent,
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.album, size: 70),
                  title: Text('Heart Shaker',
                      style: TextStyle(color: Colors.white)),
                  subtitle:
                      Text('TWICE', style: TextStyle(color: Colors.white)),
                ),
                ButtonBar(
                  children: <Widget>[
                    TextButton(
                      child: const Text('Edit',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {},
                    ),
                    TextButton(
                      child: const Text('Delete',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
