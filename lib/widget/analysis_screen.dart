import 'package:bloctest/bloc/screen/bloc/screen_bloc.dart';
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
    return Center(
      child: Column(
        children: [
          Text('Analysis Screen'),
          BlocBuilder<ScreenBloc, ScreenState>(
            builder: (context, state) {
              return Text(state.counter.toString());
            },
          )
        ],
      ),
    );
  }
}
