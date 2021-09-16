import 'package:bloctest/bloc/screen/bloc/bottom_navigation_bloc.dart';
import 'package:bloctest/bloc/test_bloc.dart';
import 'package:bloctest/ui/new_entry_screen.dart';
import 'package:bloctest/ui/root.dart';
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
                create: (context) => BottomNavigationBloc()..add(AppStarted()),
              ),
            ],
            child: Root(),
          ),
        );
      case '/new':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => _testBloc,
            child: NewEntryPage(),
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
