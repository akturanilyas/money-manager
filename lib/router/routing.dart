import 'package:bloctest/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:bloctest/bloc/firestore/firestore_bloc.dart';
import 'package:bloctest/screens/new_entry_screen.dart';
import 'package:bloctest/screens/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final BottomNavigationBloc _navbarBloc = BottomNavigationBloc();
  final FirestoreBloc _firestoreBloc = FirestoreBloc();
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => _navbarBloc..add(AppStarted()),
              ),
              BlocProvider.value(
                value: _firestoreBloc,
              ),
            ],
            child: Root(),
          ),
        );
      case '/new':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _firestoreBloc,
            child: NewEntryPage(),
          ),
        );

      default:
        return null;
    }
  }

  void dispose() {
    _firestoreBloc.close();
    _navbarBloc.close();
  }
}
