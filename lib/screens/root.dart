import 'package:bloctest/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:bloctest/screens/analysis_screen.dart';
import 'package:bloctest/screens/spend_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Root extends StatefulWidget {
  const Root({
    Key? key,
  }) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  //final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Colors.blueAccent;
    final Color secondaryColor = Colors.white;
    final Color selectedItemColor = Colors.lightGreenAccent;
    // final TestBloctestBloc = BlocProvider.of<TestBloc>(context);
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/new');
                },
                icon: Icon(Icons.add),
              )
            ],
            centerTitle: true,
            backgroundColor: primaryColor,
            title: Builder(
              builder: (_) {
                if (state is SpendPageLoaded) return Text('Spending Page');
                if (state is AnalysisPageLoaded) return Text('Analysis Page');
                return Text('Loading');
              },
            ),
          ),
          body: Builder(
            builder: (_) {
              if (state is PageLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is SpendPageLoaded) return SpendScreen();
              if (state is AnalysisPageLoaded) return AnalysisScreen();
              return Container();
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: primaryColor,

            selectedItemColor: selectedItemColor,
            unselectedItemColor: secondaryColor,
            // showUnselectedLabels: false,
            currentIndex: context
                .select((BottomNavigationBloc bloc) => bloc.currentIndex),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.attach_money_outlined),
                label: "Spending",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.auto_graph),
                label: "Analysis",
              ),
            ],
            onTap: (index) {
              context.read<BottomNavigationBloc>().add(
                    PageTapped(index: index),
                  );
            },
          ),
        );
      },
    );
  }
}
