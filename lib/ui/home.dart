import 'package:bloctest/bloc/screen/bloc/bottom_navigation_bloc.dart';
import 'package:bloctest/widget/analysis_screen.dart';
import 'package:bloctest/widget/income_screen.dart';
import 'package:bloctest/widget/spend_screen.dart';
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
    // final TestBloctestBloc = BlocProvider.of<TestBloc>(context);
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              // title: Text(state.screen.toString()),
              ),
          body: Builder(
            builder: (BuildContext context) {
              if (state is PageLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is SpendPageLoaded) return SpendScreen();
              if (state is IncomePageLoaded) return IncomeScreen();
              if (state is AnalysisPageLoaded) return AnalysisScreen();
              return Container();
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: context
                .select((BottomNavigationBloc bloc) => bloc.currentIndex),
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
            onTap: (index) {
              context
                  .read<BottomNavigationBloc>()
                  .add(PageTapped(index: index));
            },
          ),
        );
      },
    );
  }
}
