import 'package:bloctest/bloc/screen/bloc/screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ScreenBloc screenBloc = BlocProvider.of<ScreenBloc>(context);
    final BottomNavigationBar bottomNavBar = BottomNavigationBar(
      currentIndex: screenBloc.state.index,
      onTap: (index) {
        print(screenBloc.state.index);
        screenBloc.add(ChangeScreenEvent(index));
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.money_off),
          label: "Spending",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.attach_money),
          label: "Income",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.view_column),
          label: "Analysis",
        ),
      ],
    );

    // final TestBloctestBloc = BlocProvider.of<TestBloc>(context);
    return BlocBuilder<ScreenBloc, ScreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.screen.toString()),
          ),
          body: state.screen,
          bottomNavigationBar: bottomNavBar,
        );
      },
    );
  }
}
