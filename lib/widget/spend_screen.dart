import 'package:bloctest/bloc/screen/bloc/screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpendScreen extends StatefulWidget {
  const SpendScreen({Key? key}) : super(key: key);

  @override
  _SpendScreenState createState() => _SpendScreenState();
}

class _SpendScreenState extends State<SpendScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Spend Screen'),
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
