import 'package:bloctest/bloc/screen/bloc/screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({Key? key}) : super(key: key);

  @override
  _IncomeScreenState createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Income Screen'),
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
