import 'package:bloctest/bloc/screen/bloc/screen_bloc.dart';
import 'package:bloctest/bloc/test_bloc.dart';
import 'package:bloctest/ui/home.dart';
import 'package:bloctest/ui/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final TestBloc _testBloc = TestBloc();

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: _testBloc,
              ),
              BlocProvider(
                create: (context) => ScreenBloc(),
              ),
            ],
            child: Home(),
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _testBloc,
            child: SecondPage(),
          ),
        );
      default:
        return null;
    }
  }

  void dispose() {
    _testBloc.close();
  }
}
